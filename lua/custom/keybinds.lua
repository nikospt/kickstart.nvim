local nmap = function(keys, func, desc)
	vim.keymap.set('n', keys, func, { desc = desc })
end

local clear_highlights = function()
	vim.lsp.buf.clear_references()
	vim.cmd('noh')
end

local truezen = require('true-zen')
local keymap = vim.keymap

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


	vim.keymap.set('n', '<leader>dd', require('neogen').generate),
	-- TODO: This conflicts with dap and I am not sure what it does
	-- vim.keymap.set('n', '<F8>', function() vim.cmd('TagbarToggle') end),

	-- true zen keybinds
	-- vim.keymap.set('n', '<leader>tza', require('true-zen').ataraxis, { desc = '[T]rue-[Z]en ataraxis' }),
	-- vim.keymap.set('n', '<leader>tzm', require('true-zen').minimalist, { desc = '[T]rue-[Z]en minimalist' }),
	-- vim.keymap.set('n', '<leader>tzn', function() vim.cmd('TZNarrow') end, { desc = '[T]rue-[Z]en minimalist' }),

	keymap.set('n', '<leader>tzn', function()
		local first = 0
		local last = vim.api.nvim_buf_line_count(0)
		truezen.narrow(first, last)
	end, { noremap = true }),
	keymap.set('v', '<leader>tzn', function()
		local first = vim.fn.line('v')
		local last = vim.fn.line('.')
		truezen.narrow(first, last)
	end, { noremap = true }),
	keymap.set('n', '<leader>tzf', truezen.focus, { noremap = true }),
	keymap.set('n', '<leader>tzm', truezen.minimalist, { noremap = true }),
	keymap.set('n', '<leader>tza', truezen.ataraxis, { noremap = true }),

	-- TODO Navigation
	vim.keymap.set("n", "]t", function()
		require("todo-comments").jump_next()
	end, { desc = "Next todo comment" }),
	vim.keymap.set("n", "[t", function()
		require("todo-comments").jump_prev()
	end, { desc = "Previous todo comment" }),

	vim.keymap.set("n", "<leader>df", function ()
		vim.cmd({cmd='Telescope', args = {'dap', 'frames'} })
	end, { desc = 'Telescope [D]ap [F]rames'}),
	vim.keymap.set("n", "<leader>db", function ()
		vim.cmd({cmd='Telescope', args = {'dap', 'list_breakpoints'} })
	end, { desc = 'Telescope [D]ap [B]reakpoints'}),

	-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
	vim.keymap.set('n', 'zR', require('ufo').openAllFolds),
	vim.keymap.set('n', 'zM', require('ufo').closeAllFolds),

	-- Ergonomic windows navigation (basically replace <ctrl>w with <leader>n (Nemonic for [N]avigate windows)
	vim.keymap.set('n', '<leader>n', '<C-w>', {desc = '[N]avigate window control'}),
}
