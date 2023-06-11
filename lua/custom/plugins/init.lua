-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
	'BurntSushi/ripgrep',
	'sharkdp/fd',
	{ "nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
	},
	'ellisonleao/glow.nvim',
	{
		"ThePrimeagen/refactoring.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			-- Remaps for the refactoring operations currently offered by the plugin
			vim.api.nvim_set_keymap("v", "<leader>re", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]]
				, { noremap = true, silent = true, expr = false })
			vim.api.nvim_set_keymap("v", "<leader>rf",
				[[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>]],
				{ noremap = true, silent = true, expr = false })
			vim.api.nvim_set_keymap("v", "<leader>rv", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]]
				, { noremap = true, silent = true, expr = false })
			vim.api.nvim_set_keymap("v", "<leader>ri", [[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]],
				{ noremap = true, silent = true, expr = false })

			-- Extract block doesn't need visual mode
			vim.api.nvim_set_keymap("n", "<leader>rb", [[ <Cmd>lua require('refactoring').refactor('Extract Block')<CR>]],
				{ noremap = true, silent = true, expr = false })
			vim.api.nvim_set_keymap("n", "<leader>rbf", [[ <Cmd>lua require('refactoring').refactor('Extract Block To File')<CR>]]
				, { noremap = true, silent = true, expr = false })

			-- Inline variable can also pick up the identifier currently under the cursor without visual mode
			vim.api.nvim_set_keymap("n", "<leader>ri", [[ <Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]],
				{ noremap = true, silent = true, expr = false })

		end

	},
	{ import = 'custom.themes' },

}
