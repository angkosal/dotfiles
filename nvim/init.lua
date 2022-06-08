-- insures packer is installed
local execute = vim.api.nvim_command
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

-- Import Lua modules
require('plugins')
require('core/settings')
require('core/keymaps')
require('plugins/configs/nvim-tree')
require('plugins/configs/indent-blankline')
require('plugins/configs/feline')
require('plugins/configs/vista')
require('plugins/configs/nvim-cmp')
require('plugins/configs/nvim-lspconfig')
require('plugins/configs/nvim-treesitter')
require('plugins/configs/alpha-nvim')
require('plugins/configs/neogit')
require('plugins/configs/lazygit')
