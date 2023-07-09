local M = {}
local function wrapper()
	return require("vim.lsp").get_active_clients({ bufnr = vim.api.nvim_get_current_buf() })[1].name
end

function M.setup()
	require('lualine').setup {
		-- Set lualine as statusline
		-- See `:help lualine.txt`
		opts = {
			sections = { lualine_x = { 'encoding', 'fileformat', 'filetype', wrapper } },
			options = {
				icons_enabled = false,
				theme = 'auto',
				-- theme = 'tokyonight',
				component_separators = '|',
				section_separators = '',
			},
		},
		requires = { 'nvim-tree/nvim-web-devicons', opt = true },
	}
end

return M
