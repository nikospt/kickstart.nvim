local nmap = function(keys, func, desc)
	vim.keymap.set('n', keys, func, {desc = desc})
end

local clear_highlights = function()
	vim.lsp.buf.clear_references()
	vim.cmd('noh')
end

vim.keymap.set('n', '<leader>dd', require('neogen').generate)

return {
	nmap('<leader>ch', clear_highlights, '[C]lear [H]ightlights'),
	-- I should increase timeout_ms on the code format function 
	-- something like vim.lsp.buf.format({timeout_ms=10000})
	nmap('<leader>cf', vim.lsp.buf.format, 'LSP: [C]ode [F]ormat'),
	nmap('<leader>ss', vim.lsp.buf.document_highlight, 'LSP [S]cope [S]ymbols'),
	nmap('<leader>ts', require('telescope.builtin').treesitter, '[T]ree [S]itter'),
	nmap('<leader>tds', function() vim.cmd('SymbolsOutline') end, '[T]reeview of [D]ocument [S]ymbols')
}
