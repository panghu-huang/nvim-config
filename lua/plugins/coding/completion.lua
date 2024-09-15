return {
  {
    'hrsh7th/nvim-cmp',
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
      },
    },
    config = function()
      local cmp = require 'cmp'

      local lspkind = {
        Namespace = '󰌗',
        Variable = '󰀫',
        Unit = '󰑭',
        Value = '󰎠',
        Keyword = '󰌋',
        Snippet = '',
        Color = '󰏘',
        Constant = '󰏿',
        Operator = '󰆕',
        Table = '',
        Object = '󰅩',
        Tag = '',
        Array = '[]',
        Boolean = '',
        Number = '',
        Null = '󰟢',
        Supermaven = '',
        String = '󰉿',
        Calendar = '',
        Watch = '󰥔',
        Package = '',
        Copilot = '',
        Codeium = '',
        TabNine = '',
        Text = '',
        Method = '',
        Function = '',
        Constructor = '',
        Field = '',
        Class = '',
        Interface = '',
        Module = '',
        Property = '',
        Enum = '',
        File = '',
        Reference = '',
        Folder = '',
        EnumMember = '',
        Struct = '',
        Event = '',
        TypeParameter = '',
      }

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
          format = function(_, item)
            local icon = lspkind[item.kind] or ''

            item.menu = item.kind
            item.kind = ' ' .. icon .. ' '

            return item
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
