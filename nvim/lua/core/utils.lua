local M = {}
local cmd = vim.cmd
local fn = vim.fn

M.close_buffer = function(force)
	if vim.bo.buftype == 'terminal' then
		vim.api.nvim_win_hide(0)
		return
	end
	force = force or not vim.bo.buflisted or vim.bo.buftype == 'nofile'
	-- if not force, change to prev buf and then close current
	local close_cmd = force and ':bd!' or ':bp | bd' .. vim.fn.bufnr()
	vim.cmd(close_cmd)
end

M.tabline = function()
	local options = {
		show_index = true,
		show_modify = true,
		-- modify_indicator = '[+]',
		modify_indicator = '+',
		no_name = '[No Name]',
	}
	local s = ''
	for index = 1, fn.tabpagenr('$') do
		local winnr = fn.tabpagewinnr(index)
		local buflist = fn.tabpagebuflist(index)
		local bufnr = buflist[winnr]
		local bufname = fn.bufname(bufnr)
		local bufmodified = fn.getbufvar(bufnr, '&mod')
		s = s .. '%' .. index .. 'T'
		if index == fn.tabpagenr() then
			s = s .. '%#TabLineSel#'
		else
			s = s .. '%#TabLine#'
		end
		-- tab index
		s = s .. ' '
		-- index
		if options.show_index then
			s = s .. index .. ':'
		end
		-- buf name
		if bufname ~= '' then
			-- s = s .. '[' .. fn.fnamemodify(bufname, ':t') .. '] '
			s = s .. fn.fnamemodify(bufname, ':t')
		else
			s = s .. options.no_name .. ' '
		end
		-- modify indicator
		if bufmodified == 1 and options.show_modify and options.modify_indicator ~= nil then
			s = s .. options.modify_indicator .. ' '
		end
	end

	s = s .. '%#TabLineFill#'
	return s
end

return M
