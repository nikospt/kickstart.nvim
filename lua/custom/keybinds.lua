local nmap = function(keys, func, desc)
	vim.keymap.set('n', keys, func, { desc = desc })
end

local clear_highlights = function()
	vim.lsp.buf.clear_references()
	vim.cmd('noh')
end

vim.keymap.set('n', '<leader>dd', require('neogen').generate)

return {
	nmap('<leader>ch', clear_highlights, '[C]lear [H]ightlights'),
	-- Allow the codeformatter to run for 10,000 ms (10s) before timing out
	nmap('<leader>cf', function() vim.lsp.buf.format({ timeout_ms = 10000 }) end, 'LSP: [C]ode [F]ormat'),
	nmap('<leader>ss', vim.lsp.buf.document_highlight, 'LSP [S]cope [S]ymbols'),
	nmap('<leader>ts', require('telescope.builtin').treesitter, '[T]ree [S]itter'),
	nmap('<leader>tds', function() vim.cmd('SymbolsOutline') end, '[T]reeview of [D]ocument [S]ymbols'),
	nmap('<leader>it', function()
		require("telescope").load_extension('find_template')
		vim.cmd({ cmd = 'Telescope', args = { 'find_template', 'type=insert' } })
	end, '[I]nsert [T]emplate'),


	-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
	vim.keymap.set('n', 'zR', require('ufo').openAllFolds),
	vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
}
