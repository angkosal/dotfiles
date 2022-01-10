local ok, null_ls = pcall(require, "null-ls")

if not ok then
   return
end

local b = null_ls.builtins

local sources = {

   -- JS html css stuff
   -- b.formatting.prettierd.with {
   --    filetypes = { "html", "json", "markdown", "css", "javascript", "javascriptreact" },
   -- },
   b.formatting.prettierd,
   -- b.diagnostics.eslint.with {
   --    command = "eslint_d",
   -- },

   -- Lua
   b.formatting.stylua,
   b.diagnostics.luacheck.with { extra_args = { "--global vim" } },

   -- Shell
   b.formatting.shfmt,
   b.diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },

    -- PHP
    -- b.formatting.phpcbf,
    b.formatting.phpcsfixer,
    -- b.diagnostics.phpstan,
    -- b.diagnostics.psalm
    b.formatting.autopep8,
}

local M = {}

M.setup = function(on_attach)
  null_ls.setup {
    debug = true,
    sources = sources,

    -- format on save
    on_attach = function(client)
       if client.resolved_capabilities.document_formatting then
          vim.cmd "autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()"
       end
    end,
  }
end

return M
