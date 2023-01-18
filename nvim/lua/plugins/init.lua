-----------------------------------------------------------
-- Plugin manager configuration file
-----------------------------------------------------------

-- Plugin manager: packer.nvim
-- url: https://github.com/wbthomason/packer.nvim

-- For information about installed plugins see the README
--- neovim-lua/README.md
--- https://github.com/brainfucksec/neovim-lua#readme

local cmd = vim.cmd
cmd([[packadd packer.nvim]])

local packer = require('packer')

-- Add packages
return packer.startup(function()
	use('wbthomason/packer.nvim') -- packer can manage itself

	-- File explorer
	use('kyazdani42/nvim-tree.lua')

	-- Indent line
	use('lukas-reineke/indent-blankline.nvim')

	-- Autopair
	use({
		'windwp/nvim-autopairs',
		config = function()
			require('nvim-autopairs').setup()
		end,
	})

	-- Icons
	use('kyazdani42/nvim-web-devicons')

	-- Tag viewer
	use('liuchengxu/vista.vim')

	-- Treesitter interface
	use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })
	use({ 'nvim-treesitter/nvim-treesitter-textobjects' })

	-- Color schemes
	use('navarasu/onedark.nvim')

	use('tanvirtin/monokai.nvim')

	use('bluz71/vim-nightfly-guicolors')
	use('bluz71/vim-moonfly-colors')

	-- LSP
	use({
		'williamboman/mason.nvim',
		'williamboman/mason-lspconfig.nvim',
	})
	use({
		'jose-elias-alvarez/null-ls.nvim',
		'jayp0521/mason-null-ls.nvim',
	})
	use('neovim/nvim-lspconfig')

	-- Autocomplete
	use({
		'hrsh7th/nvim-cmp',
		requires = {
			'L3MON4D3/LuaSnip',
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-buffer',
			'saadparwaiz1/cmp_luasnip',
		},
	})

	-- Statusline
	use({
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true },
	})
	-- use({
	-- 	'feline-nvim/feline.nvim',
	-- 	requires = { 'kyazdani42/nvim-web-devicons' },
	-- })

	-- git labels
	use('tpope/vim-fugitive')
	use('tpope/vim-rhubarb')
	use({
		'lewis6991/gitsigns.nvim',
		requires = { 'nvim-lua/plenary.nvim' },
		config = function()
			require('gitsigns').setup()
		end,
	})

	-- Dashboard (start screen)
	use({
		'goolord/alpha-nvim',
		requires = { 'kyazdani42/nvim-web-devicons' },
	})

	use({
		'nvim-telescope/telescope.nvim',
		requires = { { 'nvim-lua/plenary.nvim' } },
	})
	use({
		'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup()
		end,
	})
	use({
		'akinsho/flutter-tools.nvim',
		requires = 'nvim-lua/plenary.nvim',
		config = function()
			require('flutter-tools').setup({})
		end,
	})

	use({
		'kdheepak/lazygit.nvim',
	})

	use({ 'rafamadriz/friendly-snippets' })
	--use {"github/copilot.vim"}
	use({
		'folke/which-key.nvim',
		-- config = function()
		-- require('which-key').setup({})
		-- end,
	})
	use({
		'dharmx/telescope-media.nvim',
		config = function()
			require('telescope').load_extension('media')
		end,
		requires = {
			'nvim-lua/plenary.nvim',
			'nvim-telescope/telescope.nvim',
		},
	})
end)
