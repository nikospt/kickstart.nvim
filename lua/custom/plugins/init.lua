-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
vim.keymap.set('n', '<leader>f', ':NvimTreeToggle<CR>', {
	noremap = true
}) -- OR setup with some options

local function script_path()
	local str = debug.getinfo(2, "S").source:sub(2)
	return str:match("(.*/)")
end
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
	"AndrewRadev/linediff.vim",
	"nat-418/tcl.nvim",
	"mfussenegger/nvim-lint",
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require('todo-comments').setup()
		end,
	},
	-- Show context of current block in top line (ex. the function definition at the top even if its a long function where the defintiion would be off the screen
	{
		"nvim-treesitter/nvim-treesitter-context",
		config = function()
			require("custom.config.treesitter-context").setup()
		end,
	},
	-- Show outline of symboles
	{
		'simrat39/symbols-outline.nvim',
		config = function()
			require("custom.config.symbols-outline").setup()
		end,
	},
	-- Allow for completion in debugger console
	{
		'rcarriga/cmp-dap',
		config = function()
			require("custom.config.cmp-dap").setup()
		end,
	},
	{
		'glepnir/template.nvim',
		cmd = { 'Template', 'TemProject' },
		config = function()
			require('template').setup({
				temp_dir = script_path() .. '../templates',
			})
		end
	},
	{
		"ray-x/lsp_signature.nvim",
		config = function()
			require('custom.config.lsp_signature').setup()
		end
	},
	{
		"barreiroleo/ltex_extra.nvim",
		ft = { "markdown", "tex" },
		dependencies = { "neovim/nvim-lspconfig" },
		config = function()
			require("ltex_extra").setup {
				path = "/media/nikos/Data/tools/languagetool/dictionaries"
			}
		end
	},
	{
		'kevinhwang91/nvim-ufo',
		dependencies = 'kevinhwang91/promise-async',
		config = function()
			require('custom.config.ufo').setup()
		end
	},
	"preservim/tagbar",
	"pocco81/true-zen.nvim",
	{
		"LiadOz/nvim-dap-repl-highlights",
		config = function()
			require('custom.config.nvim-dap-repl-highlights').setup()
		end
	},
	{
		"nvim-telescope/telescope-dap.nvim",
		config = function()
			require('custom.config.telescope-dap').setup()
		end
	},
	"nvim-treesitter/playground",
	"b0o/schemastore.nvim",
	{ import = 'custom.themes' },
}
