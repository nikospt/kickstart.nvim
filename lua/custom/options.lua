local change_vim_settings = function()
	vim.o.hlsearch = true
	vim.o.tabstop = 4
	vim.wo.relativenumber = true
end

return {
	change_vim_settings(),
	-- Insert voice into current buffer
	-- nmap('<leader>v', vim.cmd('r !vtt<cr>'), 'hi')
}
