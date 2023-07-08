local M = {}
function M.setup()
	require("nvim-tree").setup({
		sort_by = "case_sensitive",
		renderer = {
			group_empty = true,
		},
		filters = {
			dotfiles = false,
		}
	})
end

return M
