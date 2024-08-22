local M = {}

M.build_path = function()
	-- Replace vim.uv with vim.loop if using NVIM 0.9.0 or below
	if vim.uv.os_uname().sysname == 'Windows_NT' then
		return 'pwsh.exe -file .\\dl_binaries.ps1'
	else
		return './dl_binaries.sh'
	end
end

M.config = {
	disable_auto_comment = true,
	accept_keymap = '<Tab>',
	dismiss_keymap = '<C-]>',
	debounce_ms = 800,
	suggestion_color = { gui = '#808080', cterm = 244 },
	exclude_filetypes = { 'TelescopePrompt', 'NvimTree' },
	log_file_path = nil, -- absolute path to Tabnine log file
}

return M
