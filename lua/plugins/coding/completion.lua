-- Trims and formats the detail string
local function trim_detail(detail)
  if detail then
    detail = vim.trim(detail)
    if vim.startswith(detail, "(use") then
      detail = "(" .. string.sub(detail, 6)
    end
  end
  return detail
end

-- Checks if the description matches a function pattern
local function match_fn(description)
  local patterns = {
    "^pub fn", "^fn", "^unsafe fn", "^pub unsafe fn",
    "^pub const unsafe fn", "^const fn", "^pub const fn"
  }
  for _, pattern in ipairs(patterns) do
    if string.match(description, pattern) then
      return true
    end
  end
  return false
end

-- Formats function or method completion items
local function format_function_or_method(kind, label_detail)
  local detail = trim_detail(label_detail.detail)
  local description = label_detail.description

  if description and string.sub(description, -1) == "," then
    description = description:sub(1, -2)
  end

  if (detail and vim.startswith(detail, "macro")) or (description and vim.startswith(description, "macro")) then
    kind.concat = kind.abbr
    return kind
  end

  if detail and description then
    if match_fn(description) then
      local start_index = string.find(description, "(", nil, true)
      if start_index then
        description = description:sub(start_index)
      end
    end
    local index = string.find(kind.abbr, "(", nil, true)
    if index then
      local prefix = string.sub(kind.abbr, 1, index - 1)
      kind.abbr = prefix .. description .. " " .. detail
      kind.concat = "fn " .. prefix .. description .. "{}//" .. detail
      kind.offset = 3
    else
      kind.concat = kind.abbr .. "  //" .. detail
      kind.abbr = kind.abbr .. " " .. detail
    end
  elseif detail then
    kind.concat = "fn " .. kind.abbr .. "{}//" .. detail
    kind.abbr = kind.abbr .. " " .. detail
  elseif description then
    if match_fn(description) then
      local start_index = string.find(description, "%(")
      if start_index then
        description = description:sub(start_index)
      end
    end
    local index = string.find(kind.abbr, "(", nil, true)
    if index then
      local prefix = string.sub(kind.abbr, 1, index - 1)
      kind.abbr = prefix .. description .. " "
      kind.concat = "fn " .. prefix .. description .. "{}//"
      kind.offset = 3
    else
      kind.concat = kind.abbr .. "  //" .. description
      kind.abbr = kind.abbr .. " " .. description
    end
  else
    kind.concat = kind.abbr
  end

  return kind
end

-- Formats Rust completion items
local function rust_fmt(entry, vim_item)
  local kind = require("lspkind").cmp_format({
    mode = "symbol_text",
  })(entry, vim_item)
  local strings = vim.split(kind.kind, "%s", { trimempty = true })
  local completion_item = entry:get_completion_item()
  local item_kind = entry:get_kind() --- @type lsp.CompletionItemKind | number
  local label_detail = completion_item.labelDetails

  if item_kind == 3 or item_kind == 2 then -- Function/Method
    if label_detail then
      kind = format_function_or_method(kind, label_detail)
    end
  elseif item_kind == 5 then -- Field
    local detail = trim_detail(completion_item.detail)
    if detail then
      kind.concat = "struct S {" .. kind.abbr .. ": " .. detail .. "}"
      kind.abbr = kind.abbr .. ": " .. detail
    else
      kind.concat = "struct S {" .. kind.abbr .. ": String}"
    end
    kind.offset = 10
  elseif item_kind == 6 or item_kind == 21 then -- Variable/Constant
    if label_detail then
      local detail = label_detail.description
      if detail then
        kind.concat = "let " .. kind.abbr .. ": " .. detail
        kind.abbr = kind.abbr .. ": " .. detail
        kind.offset = 4
      else
        kind.concat = kind.abbr
      end
    end
  elseif item_kind == 9 then -- Module
    local detail = trim_detail(label_detail.detail)
    if detail then
      kind.concat = kind.abbr .. "  //" .. detail
      kind.abbr = kind.abbr .. " " .. detail
      kind.offset = 0
    else
      kind.concat = kind.abbr
    end
  elseif item_kind == 8 then -- Trait
    local detail = trim_detail(label_detail.detail)
    if detail then
      kind.concat = "trait " .. kind.abbr .. "{}//" .. detail
      kind.abbr = kind.abbr .. " " .. detail
    else
      kind.concat = "trait " .. kind.abbr .. "{}"
    end
    kind.offset = 6
  elseif item_kind == 22 then -- Struct
    local detail = trim_detail(label_detail.detail)
    if detail then
      kind.concat = kind.abbr .. "  //" .. detail
      kind.abbr = kind.abbr .. " " .. detail
    else
      kind.concat = kind.abbr
    end
  elseif item_kind == 1 then -- Text
    kind.concat = '"' .. kind.abbr .. '"'
    kind.offset = 1
  elseif item_kind == 14 then
    if kind.abbr == "mut" then
      kind.concat = "let mut"
      kind.offset = 4
    else
      kind.concat = kind.abbr
    end
  else
    kind.concat = kind.abbr
  end

  if item_kind == 15 then
    kind.concat = ""
  end

  kind.kind = " " .. (strings[1] or "") .. " "
  kind.menu = nil
  if string.len(kind.abbr) > 60 then
    kind.abbr = kind.abbr:sub(1, 60)
  end
  return kind
end

return {
  {
    -- 'hrsh7th/nvim-cmp',
    'xzbdmw/nvim-cmp',
    branch = 'ts-highlight',
    event = 'InsertEnter',
    dependencies = {
      {
        'L3MON4D3/LuaSnip',
        dependencies = 'rafamadriz/friendly-snippets',
        opts = {
          history = true,
          updateevents = 'TextChanged,TextChangedI',
        },
      },
      {
        'saadparwaiz1/cmp_luasnip',
        'hrsh7th/cmp-nvim-lua',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'onsails/lspkind.nvim',
      },
    },
    config = function()
      local cmp = require 'cmp'

      cmp.setup {
        completion = {
          completeopt = 'menu,menuone,noinsert',
        },
        preselect = cmp.PreselectMode.Item,
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
        formatting = {
          -- kind is icon, abbr is completion name, menu is [Function]
          fields = { "kind", "abbr", "menu" },
          format = function(entry, vim_item)
            local function commom_format(e, item)
              local kind = require("lspkind").cmp_format({
                mode = "symbol_text",
                show_labelDetails = true,
              })(e, item)
              local strings = vim.split(kind.kind, "%s", { trimempty = true })
              kind.kind = " " .. (strings[1] or "") .. " "
              kind.menu = ""
              kind.concat = kind.abbr
              return kind
            end

            if vim.bo.filetype == "rust" then
              return rust_fmt(entry, vim_item)
            end

            return commom_format(entry, vim_item)
          end,
        },
        window = {
          completion = {
            side_padding = 0,
            col_offset = -3,
            scrollbar = false,
          },
          documentation = {
            col_offset = 0,
            side_padding = 0,
          },
        },
        mapping = {
          ['<C-d>'] = cmp.mapping.scroll_docs(4),
          ['<C-u>'] = cmp.mapping.scroll_docs(-4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.close(),

          ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
          },

          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif require('luasnip').expand_or_jumpable() then
              require('luasnip').expand_or_jump()
            else
              fallback()
            end
          end, { 'i', 's' }),

          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif require('luasnip').jumpable(-1) then
              require('luasnip').jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),
        },
        sources = {
          { name = 'nvim_lsp', group_index = 2 },
          { name = 'luasnip',  group_index = 2 },
          { name = 'buffer',   group_index = 2 },
          { name = 'nvim_lua', group_index = 2 },
          { name = 'path',     group_index = 2 },
          { name = 'crates',   group_index = 2 },
        },
      }

      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' },
        }, {
          { name = 'cmdline' },
        }),
        matching = { disallow_symbol_nonprefix_matching = true },
      })
    end,
  },
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    opts = {},
  },
}
