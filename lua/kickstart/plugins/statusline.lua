local function wrapper()
  return require("vim.lsp").get_active_clients({bufnr = vim.api.nvim_get_current_buf()})[1].name
end
return  {
  -- Set lualine as statusline
  'nvim-lualine/lualine.nvim',
  -- See `:help lualine.txt`
  opts = {
  sections = { lualine_x = {'encoding', 'fileformat', 'filetype', wrapper} },
    options = {
      icons_enabled = false,
      theme = 'auto',
      -- theme = 'tokyonight',
      component_separators = '|',
      section_separators = '',
    },
  },
}

