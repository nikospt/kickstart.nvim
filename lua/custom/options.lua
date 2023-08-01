local change_vim_settings = function()
	vim.o.hlsearch = true
	vim.o.tabstop = 4
	vim.o.shiftwidth = 4
	vim.wo.relativenumber = true

	-- For the UFO plugin
	vim.o.foldcolumn = '1' -- '0' is not bad
	vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
	vim.o.foldlevelstart = 99
	vim.o.foldenable = true
end

return {
	change_vim_settings(),
	-- Insert voice into current buffer
	-- nmap('<leader>v', vim.cmd('r !vtt<cr>'), 'hi')
}
