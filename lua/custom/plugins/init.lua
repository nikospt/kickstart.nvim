-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
vim.keymap.set('n', '<leader>f', ':NvimTreeToggle<CR>', {
	noremap = true
}) -- OR setup with some options
return {
	-- Used for grep search in telescope
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
	{
		'nvim-tree/nvim-web-devicons',
		config = function()
			require("custom.config.nvim-web-devicons").setup()
		end
	},
	-- Markdown viewer
	'ellisonleao/glow.nvim',
	'L3MON4D3/LuaSnip',
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
	'f-person/git-blame.nvim',
	{
		'nvim-lualine/lualine.nvim',
		config = function()
			require("custom.config.lualine").setup()
		end,
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require('todo-comments').setup()
		end,
	},
	{
		'rcarriga/cmp-dap',
		config = function()
			require("custom.config.cmp-dap").setup()
		end,

	},
	{ import = 'custom.themes' },
}
