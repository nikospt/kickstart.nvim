return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      vim.cmd.colorscheme 'tokyonight-storm'
    end,
  },
  "Mofiqul/dracula.nvim",
  "ellisonleao/gruvbox.nvim",
  { "rose-pine/neovim", name = "rose-pine" },
  "nyoom-engineering/nyoom.nvim",
  "jacoborus/tender.vim",
  "rebelot/kanagawa.nvim",
  { "bluz71/vim-nightfly-colors", name = "nightfly", lazy = false, priority = 1000 },
}
