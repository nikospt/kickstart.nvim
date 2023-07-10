local M = {}


function M.setup()
	require('nvim-web-devicons').setup {
		override = {
			tex = {
				-- icon = '\ue69b',
				color = "#428850",
				cterm_color = "65",
				name = "Zsh"
			}
		},

	}
end

return M
