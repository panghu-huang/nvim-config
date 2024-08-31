vim.g.base46_cache = vim.fn.stdpath("data") .. "/nvchad/base46/"
vim.g.mapleader = " "

require("tools.lazy-nvim").setup({
	colorscheme = "tokyonight",
	plugins = {
		{ import = "plugins.ui" },
		{ import = "plugins.coding" },
		{ import = "plugins.lsp" },
	},
})

vim.cmd([[ colorscheme tokyonight ]])

require("options")

vim.schedule(function()
	require("mappings")
end)
