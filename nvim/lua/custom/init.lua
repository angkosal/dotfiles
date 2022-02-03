-- MAPPINGS
local map = require("core.utils").map

-- set difference tab default 2
vim.api.nvim_command('autocmd BufEnter *.php setlocal shiftwidth=4')
vim.api.nvim_command('autocmd BufEnter *.py setlocal shiftwidth=4')

--    map("n", "<leader>cc", "gg0vG$d", opt) -- example to delete the buffer
--    .... many more mappings ....
map("n", "tn", ":tabnew<CR>:Telescope find_files<CR>", opt) -- open new tab and find files
map("n", "<Tab>", "%", opt)
map("v", "<Tab>", "%", opt)
map("i", "<C-H>", "<C-W>", {noremap = true})

map("n", "<M-j>", ":resize -2<CR>", opt)
map("n", "<M-k>", ":resize +2<CR>", opt)
map("n", "<M-h>", ":vertical resize -2<CR>", opt)
map("n", "<M-l>", ":vertical resize +2<CR>", opt)
map("n", "<space>fm", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
map("v", "<C-r>", "\"hy:%s/<C-r>h//gc<left><left><left>", opts)

for i = 1, 9 do
  map("n", "<leader>"..i, ":"..i.."tabnext<CR>", opt) -- example to delete the buffer
end

map('n', '<Leader>r', [[<cmd>lua require'rest-nvim'.run()<cr>]], {noremap = true, silent = true})
