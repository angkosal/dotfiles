local present, wk = pcall(require, 'which-key')

if not present then
	return
end

local options = {

	icons = {
		breadcrumb = '»', -- symbol used in the command line area that shows your active key combo
		separator = '  ', -- symbol used between a key and it's label
		group = '+', -- symbol prepended to a group
	},

	popup_mappings = {
		scroll_down = '<c-d>', -- binding to scroll down inside the popup
		scroll_up = '<c-u>', -- binding to scroll up inside the popup
	},

	window = {
		border = 'none', -- none/single/double/shadow
	},

	layout = {
		spacing = 6, -- spacing between columns
	},

	hidden = { '<silent>', '<cmd>', '<Cmd>', '<CR>', 'call', 'lua', '^:', '^ ' },

	triggers_blacklist = {
		-- list of mode / prefixes that should never be hooked by WhichKey
		i = { 'j', 'k' },
		v = { 'j', 'k' },
	},
}

-- options = require('core.utils').load_override(options, 'folke/which-key.nvim')

wk.setup(options)
wk.register({
	g = {
		name = 'Git',
	},
	f = {
		name = 'File',
	},
	l = {
		name = 'LSP',
		a = { '<cmd>lua vim.lsp.buf.code_action()<cr>', 'Code Action' },
		d = { '<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>', 'Buffer Diagnostics' },
		w = { '<cmd>Telescope diagnostics<cr>', 'Diagnostics' },
		f = { "<cmd>lua require('lvim.lsp.utils').format()<cr>", 'Format' },
		i = { '<cmd>LspInfo<cr>', 'Info' },
		I = { '<cmd>Mason<cr>', 'Mason Info' },
		j = {
			'<cmd>lua vim.diagnostic.goto_next()<cr>',
			'Next Diagnostic',
		},
		k = {
			'<cmd>lua vim.diagnostic.goto_prev()<cr>',
			'Prev Diagnostic',
		},
		l = { '<cmd>lua vim.lsp.codelens.run()<cr>', 'CodeLens Action' },
		q = { '<cmd>lua vim.diagnostic.setloclist()<cr>', 'Quickfix' },
		r = { '<cmd>lua vim.lsp.buf.rename()<cr>', 'Rename' },
		s = { '<cmd>Telescope lsp_document_symbols<cr>', 'Document Symbols' },
		S = {
			'<cmd>Telescope lsp_dynamic_workspace_symbols<cr>',
			'Workspace Symbols',
		},
		e = { '<cmd>Telescope quickfix<cr>', 'Telescope Quickfix' },
	},
}, { prefix = '<leader>' })
