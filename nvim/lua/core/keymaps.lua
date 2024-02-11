-- local vi_mode_utils = require('feline.providers.vi_mode')
-----------------------------------------------------------
-- Define keymaps of Neovim and installed plugins.
-----------------------------------------------------------

local function map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend('force', options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Change leader to a comma
vim.g.mapleader = ' '

-----------------------------------------------------------
-- Neovim shortcuts
-----------------------------------------------------------

-- Clear search highlighting with <leader> and c
map('n', '<C-c>', ':nohl<CR>')

-- Don't use arrow keys
map('', '<up>', '<nop>')
map('', '<down>', '<nop>')
map('', '<left>', '<nop>')
map('', '<right>', '<nop>')

-- Fast saving with <leader> and s
map('n', '<leader>w', ':w!<CR>')
map('n', '<C-s>', ':w!<CR>')

-- Move around splits using Ctrl + {h,j,k,l}
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')
map('n', 'th', '<C-w>h')
map('n', 'tj', '<C-w>j')
map('n', 'tk', '<C-w>k')
map('n', 'tl', '<C-w>l')

-- close tab
map('n', ',c', ':tabclose<CR>')
-- no highlighting search
map('n', ',<space>', ':noh<CR>')

-----------------------------------------------------------
-- Applications and Plugins shortcuts
-----------------------------------------------------------

-- Terminal mappings
map('n', '<C-t>', ':Term<CR>', { noremap = true }) -- open
map('t', '<Esc>', '<C-\\><C-n>') -- exit

map('n', '<Tab>', '%', opt)
map('v', '<Tab>', '%', opt)
map('i', '<C-H>', '<C-W>', { noremap = true })

-- Resize current window
map('n', '<M-j>', ':resize -2<CR>', opt)
map('n', '<M-k>', ':resize +2<CR>', opt)
map('n', '<M-h>', ':vertical resize -2<CR>', opt)
map('n', '<M-l>', ':vertical resize +2<CR>', opt)

-- Vista tag-viewer
map('n', '<leader>m', ':Vista!!<CR>') -- open/close

map('n', '<leader>;', ':Alpha<CR>') -- open/close
map('n', '<leader>c', ':Telescope commands<CR>', { desc = 'Commands' }) -- open/close
map('n', '<leader>q', ':qa!<CR>', { desc = 'Quick' })
map('n', '<leader>/', '<Plug>(comment_toggle_linewise_current)', { desc = 'Comment' })
map('v', '<leader>/', '<Plug>(comment_toggle_linewise_visual)', { desc = 'Comment' })

-- NvimTree
map('n', '<leader>e', ':NvimTreeToggle<CR>', { desc = 'Toggle Menu' }) -- open/close
map('n', '<leader>r', ':NvimTreeRefresh<CR>', { desc = 'Refresh Menu' }) -- refresh
map('n', '<leader>n', ':NvimTreeFindFile<CR>', { desc = 'NvimTreeFindFile' }) -- search file

-- Telescrope
map('n', '<leader>fb', ':Telescope buffers <CR>', { desc = 'Find Buffers' })
map('n', '<leader>ff', ':Telescope find_files <CR>', { desc = 'Find Files' })
map('n', '<C-p>', ':Telescope find_files <CR>', { desc = 'Find Files' })
map('n', '<leader>fa', ':Telescope find_files follow=true no_ignore=true hidden=true <CR>', { desc = 'Find All' })
map('n', '<leader>fh', ':Telescope help_tags <CR>')
map('n', '<leader>fw', ':Telescope live_grep <CR>')
map('n', '<leader>fo', ':Telescope oldfiles <CR>')
map('n', '<leader>fp', ':lua vim.lsp.buf.format() <CR>')

map('n', '<leader>th', ':Telescope themes <CR>')

-- Git
map('n', '<leader>gg', '<cmd>Git<cr>', { desc = 'Git' })
map('n', '<leader>gj', "<cmd>lua require 'gitsigns'.next_hunk()<cr>", { desc = 'Next hunk' })
map('n', '<leader>gk', "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", { desc = 'Prev hunk' })
map('n', '<leader>gl', "<cmd>lua require 'gitsigns'.blame_line()<cr>", { desc = 'Blame line' })
map('n', '<leader>gp', "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", { desc = 'Preview hunk' })
map('n', '<leader>gr', "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", { desc = 'Reset hunk' })
map('n', '<leader>gR', "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", { desc = 'Reset Buff' })
map('n', '<leader>gs', "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", { desc = 'Stage hunk' })
map('n', '<leader>gu', "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", { desc = 'Undo stage hunk' })
map('n', '<leader>go', '<cmd>Telescope git_status<cr>', { desc = 'Git status' })
map('n', '<leader>gb', '<cmd>Telescope git_branches<cr>', { desc = 'Git branches' })
map('n', '<leader>gc', '<cmd>Telescope git_commits<cr>', { desc = 'Git commits' })
map('n', '<leader>gC', '<cmd>Telescope git_bcommits<cr>', { desc = 'Git bcommits' })
map('n', '<leader>gd', '<cmd>Gdiffsplit <cr>', { desc = 'Git diff' })
map('n', '<leader>gD', '<cmd>Gitsigns diffthis HEAD<cr>', { desc = 'Git diff HEAD' })
-- Git v-mode
map('v', '<leader>gr', "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", { desc = 'Reset hunk' })
map('v', '<leader>gs', "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", { desc = 'Stage hunk' })

-- Copilot
map('i', '<C-j>', 'copilot#Accept("<CR>")', { expr = true, silent = true })

-- get current buffer filetype function
function run_f1()
	-- if it flutter should run restart
	if vim.bo.filetype == 'dart' and string.match(vim.fn.expand('%'), 'test') then
		vim.cmd(':!flutter test %')
	elseif vim.bo.filetype == 'dart' or vim.fn.expand('%') == '__FLUTTER_DEV_LOG__' then
		vim.cmd("lua require('flutter-tools.commands').restart()")
	elseif
		(vim.bo.filetype == 'javascript' or vim.bo.filetype == 'typescript' or vim.bo.filetype == 'typescriptreact')
		and (string.match(vim.fn.expand('%'), '.test.') or string.match(vim.fn.expand('%'), '-spec.'))
	then
		vim.cmd(':!yarn test %')
	else
		-- vim.cmd(':make<CR>')
		print(vim.bo.filetype)
		vim.cmd('make')
	end
end

function run_f5()
	-- if it flutter should run
	if vim.bo.filetype == 'dart' then
		vim.cmd("lua require('flutter-tools.commands').run_command()")
	end
end

-- Run makefile
map('', '<F1>', '<ESC>:lua run_f1()<CR>', opt)
map('', '<F5>', '<ESC>:lua run_f5()<CR>', opt)

-- Buffer
for i = 1, 9 do
	map('n', '<leader>' .. i, ':' .. i .. 'tabnext<CR>', { desc = 'Tab ' .. i }) -- example to delete the buffer
end
map('n', 'tn', ':tabnew<CR>:Telescope find_files<CR>', opt) -- open new tab and find files
map('n', '<leader>d', ":lua require('core.utils').close_buffer() <CR>", { desc = 'Close buffer' }) -- close  buffer
