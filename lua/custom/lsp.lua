local lsp = {}
lsp.servers = {
  pylsp = {
    pylsp = {
      plugins = {
        pycodestyle = {
          ignore = { 'E501', 'W503', 'W504', 'E704', 'E731' },
          maxLineLength = 120
        },
        jedi_completion = {
          cache_for = {"pandas","numpy","tensorflow","matplotlib"}
        }
      }
    }
  },
}

return lsp
