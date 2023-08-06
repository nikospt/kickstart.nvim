return {
  "Mofiqul/dracula.nvim",
  "ellisonleao/gruvbox.nvim",
  "jacoborus/tender.vim",
  "rebelot/kanagawa.nvim",
  "tanvirtin/monokai.nvim",
  "catppuccin/nvim",
  "sonph/onehalf",
  "NLKNguyen/papercolor-theme",
  "nyoom-engineering/oxocarbon.nvim",
  "sainnhe/edge",
  "nvimdev/zephyr-nvim",
  { "rose-pine/neovim",           name = "rose-pine" },
  { "bluz71/vim-nightfly-colors", name = "nightfly", lazy = false, priority = 1000 },

  -- vim.keymap.set('n', '<leader>ct', require('telescope.builtin').colorscheme, { desc = '[C]hange [T]heme' })
  vim.keymap.set('n', '<leader>ct', function()
    require('telescope.builtin').colorscheme({ enable_preview = true })
  end, { desc = '[C]hange [T]heme' })
}
