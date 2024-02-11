local M = {}

local present1, mason_lsp = pcall(require, 'mason-lspconfig')
if not present1 then
	return
end

local precent_nvim_lsp, nvim_lsp = pcall(require, 'lspconfig')
if not precent_nvim_lsp then
	return
end

local precent_null_ls, null_ls = pcall(require, 'null-ls')
if not precent_null_ls then
	return
end

local precent_mason_null_ls, mason_null_ls = pcall(require, 'mason-null-ls')
if not precent_mason_null_ls then
	return
end

-- -- Add additional capabilities supported by nvim-cmp
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.completion.completionItem.documentationFormat = { 'markdown', 'plaintext' }
-- capabilities.textDocument.completion.completionItem.snippetSupport = true
-- capabilities.textDocument.completion.completionItem.preselectSupport = true
-- capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
-- capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
-- capabilities.textDocument.completion.completionItem.deprecatedSupport = true
-- capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
-- capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
-- capabilities.textDocument.completion.completionItem.resolveSupport = {
--   properties = {
--     'documentation',
--     'detail',
--     'additionalTextEdits',
--   },
-- }
--
-- -- Use an on_attach function to only map the following keys
-- -- after the language server attaches to the current buffer
-- local on_attach = function(client, bufnr)
--   local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
--   local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
--
--   -- Highlighting references
--   if client.server_capabilities.document_highlight then
--     vim.api.nvim_exec(
--       [[
--       augroup lsp_document_highlight
--         autocmd! * <buffer>
--         autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
--         autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
--       augroup END
--     ]], false)
--   end
--
--   -- Enable completion triggered by <c-x><c-o>
--   buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
--
--   -- Mappings.
--   local opts = { noremap=true, silent=true }
--
--   -- See `:help vim.lsp.*` for documentation on any of the below functions
--   buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
--   buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
--   buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
--   buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
--   buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
--   buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
--   buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
--   buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
--   buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
--   buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
--   buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
--   buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
--   -- buf_set_keymap('n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
--   buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
--   buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
--   buf_set_keymap('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
--   buf_set_keymap('n', '<leader>fm', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
--
-- end

-- vim.api.nvim_create_augroup("_mason", { clear = true })

-- vim.api.nvim_create_user_command("MasonInstallAll", function()
--   vim.cmd("MasonInstall " .. table.concat(options.ensure_installed, " "))
-- end, {})

M.options={
	ensure_installed = { 'gopls' },
}

M.setup_handlers={
	-- The first entry (without a key) will be the default handler
	-- and will be called for each installed server that doesn't have
	-- a dedicated handler.
	function(server_name) -- default handler (optional)
		-- nvim_lsp[server_name].setup {
		--   on_attach = on_attach,
		--   capabilities = capabilities,
		--   flags = {
		--     debounce_text_changes = 150,
		--   }
		-- }
		nvim_lsp[server_name].setup({})
	end,
	-- Next, you can provide a dedicated handler for specific servers.
	-- For example, a handler override for the `rust_analyzer`:
	-- ["rust_analyzer"] = function ()
	--     require("rust-tools").setup {}
	-- end
	['omnisharp_mono'] = function()
		nvim_lsp.omnisharp_mono.setup({
			on_attach = function(client, bufnr)
				client.server_capabilities.semanticTokensProvider = {
					full = vim.empty_dict(),
					legend = {
						tokenModifiers = { 'static_symbol' },
						tokenTypes = {
							'comment',
							'excluded_code',
							'identifier',
							'keyword',
							'keyword_control',
							'number',
							'operator',
							'operator_overloaded',
							'preprocessor_keyword',
							'string',
							'whitespace',
							'text',
							'static_symbol',
							'preprocessor_text',
							'punctuation',
							'string_verbatim',
							'string_escape_character',
							'class_name',
							'delegate_name',
							'enum_name',
							'interface_name',
							'module_name',
							'struct_name',
							'type_parameter_name',
							'field_name',
							'enum_member_name',
							'constant_name',
							'local_name',
							'parameter_name',
							'method_name',
							'extension_method_name',
							'property_name',
							'event_name',
							'namespace_name',
							'label_name',
							'xml_doc_comment_attribute_name',
							'xml_doc_comment_attribute_quotes',
							'xml_doc_comment_attribute_value',
							'xml_doc_comment_cdata_section',
							'xml_doc_comment_comment',
							'xml_doc_comment_delimiter',
							'xml_doc_comment_entity_reference',
							'xml_doc_comment_name',
							'xml_doc_comment_processing_instruction',
							'xml_doc_comment_text',
							'xml_literal_attribute_name',
							'xml_literal_attribute_quotes',
							'xml_literal_attribute_value',
							'xml_literal_cdata_section',
							'xml_literal_comment',
							'xml_literal_delimiter',
							'xml_literal_embedded_expression',
							'xml_literal_entity_reference',
							'xml_literal_name',
							'xml_literal_processing_instruction',
							'xml_literal_text',
							'regex_comment',
							'regex_character_class',
							'regex_anchor',
							'regex_quantifier',
							'regex_grouping',
							'regex_alternation',
							'regex_text',
							'regex_self_escaped_character',
							'regex_other_escape',
						},
					},
					range = true,
				}
			end,
		})
	end,
}

mason_null_ls.setup({
	ensure_installed = { 'stylua' },
	automatic_setup = true,
	handlers = {
		-- function(source_name, methods)
		-- all sources with no handler get passed here
		-- Keep original functionality of `automatic_setup = true`
		-- require('mason-null-ls.automatic_setup')(source_name, methods)
		-- end,
		stylua = function(source_name, methods)
			null_ls.register(null_ls.builtins.formatting.stylua)
		end,
	},
})

-- will setup any installed and configured sources above
null_ls.setup()


return M