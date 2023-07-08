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
			require('custom.config.vimtex').setup(opts)
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
			require("custom.config.refactoring").setup()
		end
	},
	{
		"nvim-tree/nvim-tree.lua",
		config = function()
			require("custom.config.nvim-tree").setup()
		end,
	},
	'stevearc/dressing.nvim',
	{
		'danymat/neogen',
		config = function()
			require("custom.config.neogen").setup()
		end,
	},

	{ import = 'custom.themes' },
}
