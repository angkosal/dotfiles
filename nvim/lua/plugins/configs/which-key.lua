local present, wk = pcall(require, 'which-key')

if not present then
	return
end

local M = {}

M.options = {

	icons = {
		breadcrumb = '»', -- symbol used in the command line area that shows your active key combo
		separator = '  ', -- symbol used between a key and it's label
		group = '+', -- symbol prepended to a group
	},

	layout = {
		spacing = 6, -- spacing between columns
	},
}

-- options = require('core.utils').load_override(options, 'folke/which-key.nvim')

M.register = {
	{ '<leader>f', group = 'File' },
	{ '<leader>g', group = 'Git' },
	{ '<leader>l', group = 'LSP' },
	{ '<leader>lI', '<cmd>Mason<cr>', desc = 'Mason Info' },
	{ '<leader>lS', '<cmd>Telescope lsp_dynamic_workspace_symbols<cr>', desc = 'Workspace Symbols' },
	{ '<leader>la', '<cmd>lua vim.lsp.buf.code_action()<cr>', desc = 'Code Action' },
	{ '<leader>ld', '<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>', desc = 'Buffer Diagnostics' },
	{ '<leader>le', '<cmd>Telescope quickfix<cr>', desc = 'Telescope Quickfix' },
	{ '<leader>lf', "<cmd>lua require('lvim.lsp.utils').format()<cr>", desc = 'Format' },
	{ '<leader>li', '<cmd>LspInfo<cr>', desc = 'Info' },
	{ '<leader>lj', '<cmd>lua vim.diagnostic.goto_next()<cr>', desc = 'Next Diagnostic' },
	{ '<leader>lk', '<cmd>lua vim.diagnostic.goto_prev()<cr>', desc = 'Prev Diagnostic' },
	{ '<leader>ll', '<cmd>lua vim.lsp.codelens.run()<cr>', desc = 'CodeLens Action' },
	{ '<leader>lq', '<cmd>lua vim.diagnostic.setloclist()<cr>', desc = 'Quickfix' },
	{ '<leader>lr', '<cmd>lua vim.lsp.buf.rename()<cr>', desc = 'Rename' },
	{ '<leader>ls', '<cmd>Telescope lsp_document_symbols<cr>', desc = 'Document Symbols' },
	{ '<leader>lw', '<cmd>Telescope diagnostics<cr>', desc = 'Diagnostics' },
}

--}, { prefix = '<leader>' })
return M
