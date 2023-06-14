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

local change_vim_settings = function()
	vim.o.hlsearch = true
	vim.o.tabstop = 4
end

return {
	change_vim_settings(),
	nmap('<leader>ch', clear_highlights, '[C]lear [H]ightlights'),
	nmap('<leader>cf', vim.lsp.buf.format, '[C]ode [F]ormat'),
	nmap('<leader>ss', vim.lsp.buf.document_highlight, '[S]cope [S]ymbols'),
	nmap('<leader>ts', require('telescope.builtin').treesitter, '[T]ree [S]itter'),
	-- Insert voice into current buffer
	-- nmap('<leader>v', vim.cmd('r !vtt<cr>'), 'hi')
}
