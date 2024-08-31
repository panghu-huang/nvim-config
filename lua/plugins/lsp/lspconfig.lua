return {
	"neovim/nvim-lspconfig",
	event = "UIEnter",
	config = function()
		local lspconfig = require("lspconfig")

		lspconfig.html.setup({})

		lspconfig.lua_ls.setup({
			on_attach = function() end,
			on_init = function() end,

			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						library = {
							vim.fn.expand("$VIMRUNTIME/lua"),
							vim.fn.expand("$VIMRUNTIME/lua/vim/lsp"),
							-- vim.fn.stdpath("data") .. "/lazy/ui/nvchad_types",
							vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy",
						},
						maxPreload = 100000,
						preloadFileSize = 10000,
					},
				},
			},
		})
	end,
}
