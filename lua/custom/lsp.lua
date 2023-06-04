local lsp = {}
lsp.servers = {
	pylsp = {
		pylsp = {
			plugins = {
				pycodestyle = {
					-- ignore = { 'E501' },
					maxLineLength = 120
				}
			}
		}
	}
}

return lsp
