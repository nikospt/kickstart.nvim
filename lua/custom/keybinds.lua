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
	nmap('<leader>cf', function() vim.lsp.buf.format({timeout_ms= 10000}) end, 'LSP: [C]ode [F]ormat'),
	nmap('<leader>ss', vim.lsp.buf.document_highlight, 'LSP [S]cope [S]ymbols'),
	nmap('<leader>ts', require('telescope.builtin').treesitter, '[T]ree [S]itter'),
	nmap('gtp', require('gitsigns').prev_hunk, 'Go to Previous Hunk'),
	nmap('gtn', require('gitsigns').next_hunk, 'Go to Next Hunk'),
	nmap('<leader>tds', function() vim.cmd('SymbolsOutline') end, '[T]reeview of [D]ocument [S]ymbols')
}
