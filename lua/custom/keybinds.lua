local nmap = function(keys, func, desc)
	if desc then
		desc = 'LSP: ' .. desc
	end

	vim.keymap.set('n', keys, func)
end

local clear_highlights = function()
	vim.lsp.buf.clear_references()
	vim.cmd('noh')
end

return {
	nmap('<leader>ch', clear_highlights, '[C]lear [H]ightlights'),
	nmap('<leader>cf', vim.lsp.buf.format, '[C]ode [F]ormat'),
	nmap('<leader>ss', vim.lsp.buf.document_highlight, '[S]cope [S]ymbols'),
	nmap('gtp', require('gitsigns').prev_hunk, 'Go to Previous Hunk'),
	nmap('gtn', require('gitsigns').next_hunk, 'Go to Next Hunk')
}
