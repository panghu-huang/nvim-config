local cmp = require 'theme.cmp'

local M = {}

local function setup()
	for name, hl in pairs(cmp) do
		vim.api.nvim_set_hl(0, name, hl)
	end
end

M.setup = setup

return M
