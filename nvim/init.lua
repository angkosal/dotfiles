-- insures lazy.nvim is installed
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		'git',
		'clone',
		'--filter=blob:none',
		'https://github.com/folke/lazy.nvim.git',
		'--branch=stable', -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Import Lua modules
require('plugins')
require('core/settings')
require('core/keymaps')
require('core/colors')
require('plugins/configs/nvim-tree')
require('plugins/configs/indent-blankline')
require('plugins/configs/lualine')
require('plugins/configs/vista')
require('plugins/configs/nvim-cmp')
require('plugins/configs/nvim-treesitter')
require('plugins/configs/alpha-nvim')
require('plugins/configs/lazygit')
require('plugins/configs/telescope')
require('plugins/configs/mason')
require('plugins/configs/which-key')
