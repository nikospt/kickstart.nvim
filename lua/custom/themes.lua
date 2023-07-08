return {
  "Mofiqul/dracula.nvim",
  "ellisonleao/gruvbox.nvim",
  { "rose-pine/neovim", name = "rose-pine" },
  "nyoom-engineering/nyoom.nvim",
  "jacoborus/tender.vim",
  "rebelot/kanagawa.nvim",
  "tanvirtin/monokai.nvim",
  "catppuccin/nvim",
  "sonph/onehalf",
  "NLKNguyen/papercolor-theme",
  { "bluz71/vim-nightfly-colors", name = "nightfly", lazy = false, priority = 1000 },
  vim.keymap.set('n', '<leader>ct', require('telescope.builtin').colorscheme, { desc = '[C]hange [T]heme' })
}
