-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
vim.keymap.set('n', '<leader>f', ':NvimTreeToggle<CR>', {
	noremap = true
}) -- OR setup with some options
return {
	'BurntSushi/ripgrep',
	'sharkdp/fd',
	{
		"lervag/vimtex",
		ft = { "tex" },
		opts = { patterns = { "*.tex" } },
		config = function(_, opts)
			vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
				pattern = opts.patterns,
				callback = function()
					vim.cmd [[VimtexCompile]]
				end,
			})

			-- Live compilation
			vim.g.vimtex_compiler_latexmk = {
				build_dir = ".out",
				options = {
					"-shell-escape",
					"-verbose",
					"-file-line-error",
					"-interaction=nonstopmode",
					"-synctex=1",
				},
			}
			vim.g.vimtex_view_method = "zathura"
			vim.g.vimtex_fold_enabled = true
			vim.g.vimtex_syntax_conceal = {
				accents = 1,
				ligatures = 1,
				cites = 1,
				fancy = 1,
				spacing = 0, -- default: 1
				greek = 1,
				math_bounds = 1,
				math_delimiters = 1,
				math_fracs = 1,
				math_super_sub = 1,
				math_symbols = 1,
				sections = 0,
				styles = 1,
			}
		end,
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
			vim.api.nvim_set_keymap("v", "<leader>re",
				[[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]]
				, { noremap = true, silent = true, expr = false })
			vim.api.nvim_set_keymap("v", "<leader>rf",
				[[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>]],
				{ noremap = true, silent = true, expr = false })
			vim.api.nvim_set_keymap("v", "<leader>rv",
				[[ <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]]
				, { noremap = true, silent = true, expr = false })
			vim.api.nvim_set_keymap("v", "<leader>ri",
				[[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]],
				{ noremap = true, silent = true, expr = false })

			-- Extract block doesn't need visual mode
			vim.api.nvim_set_keymap("n", "<leader>rb",
				[[ <Cmd>lua require('refactoring').refactor('Extract Block')<CR>]],
				{ noremap = true, silent = true, expr = false })
			vim.api.nvim_set_keymap("n", "<leader>rbf",
				[[ <Cmd>lua require('refactoring').refactor('Extract Block To File')<CR>]]
				, { noremap = true, silent = true, expr = false })

			-- Inline variable can also pick up the identifier currently under the cursor without visual mode
			vim.api.nvim_set_keymap("n", "<leader>ri",
				[[ <Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]],
				{ noremap = true, silent = true, expr = false })
		end
	},
	{
		"nvim-tree/nvim-tree.lua",
		config = function()
			require("nvim-tree").setup({
				sort_by = "case_sensitive",
				renderer = {
					group_empty = true,
				},
				filters = {
					dotfiles = true,
				}
			})
		end,
	},
		'stevearc/dressing.nvim',
		{ import = 'custom.themes' },
}
