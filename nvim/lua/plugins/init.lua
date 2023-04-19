-----------------------------------------------------------
-- Plugin manager configuration file
-----------------------------------------------------------

-- Plugin manager: lazy.nvim
-- url: https://github.com/folke/lazy.nvim

-- For information about installed plugins see the README
--- neovim-lua/README.md
--- https://github.com/brainfucksec/neovim-lua#readme

-- Add packages
require('lazy').setup({
	-- use('wbthomason/packer.nvim') -- packer can manage itself
	'nvim-lua/plenary.nvim',
	-- File explorer
	'kyazdani42/nvim-tree.lua',

	-- Indent line
	'lukas-reineke/indent-blankline.nvim',

	-- Autopair
	{
		'windwp/nvim-autopairs',
		config = function()
			require('nvim-autopairs').setup()
		end,
	},

	-- Icons
	'kyazdani42/nvim-web-devicons',

	-- Tag viewer
	'liuchengxu/vista.vim',

	-- Treesitter interface
	{ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' },
	{ 'nvim-treesitter/nvim-treesitter-textobjects' },

	-- Color schemes
	'bluz71/vim-nightfly-guicolors',

	-- LSP
	'williamboman/mason.nvim',
	'williamboman/mason-lspconfig.nvim',
	'jose-elias-alvarez/null-ls.nvim',
	'neovim/nvim-lspconfig',
	{
		'jay-babu/mason-null-ls.nvim',
		event = { 'BufReadPre', 'BufNewFile' },
		dependencies = {
			'williamboman/mason.nvim',
			'jose-elias-alvarez/null-ls.nvim',
		},
		-- config = function()
		--   require("your.null-ls.config") -- require your null-ls config here (example below)
		-- end,
	},

	-- Autocomplete
	{
		'hrsh7th/nvim-cmp',
		dependencies = {
			'L3MON4D3/LuaSnip',
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-buffer',
			'saadparwaiz1/cmp_luasnip',
		},
	},

	-- Statusline
	'nvim-lualine/lualine.nvim',

	-- git labels
	'tpope/vim-fugitive',
	'tpope/vim-rhubarb',
	{
		'lewis6991/gitsigns.nvim',
		requires = { 'nvim-lua/plenary.nvim' },
		config = function()
			require('gitsigns').setup()
		end,
	},

	-- Dashboard (start screen)
	{
		'goolord/alpha-nvim',
		requires = { 'kyazdani42/nvim-web-devicons' },
	},

	{
		'nvim-telescope/telescope.nvim',
		requires = { { 'nvim-lua/plenary.nvim' } },
	},
	{
		'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup()
		end,
	},
	{
		'akinsho/flutter-tools.nvim',
		config = function()
			require('flutter-tools').setup({})
		end,
	},

	{
		'kdheepak/lazygit.nvim',
	},

	{ 'rafamadriz/friendly-snippets' },
	--use {"github/copilot.vim"}
	{
		'folke/which-key.nvim',
		-- config = function()
		-- require('which-key').setup({})
		-- end,
	},
	{
		'nvim-telescope/telescope-media-files.nvim',
		config = function()
			require('telescope').load_extension('media_files')
		end,
		requires = {
			'nvim-lua/plenary.nvim',
			'nvim-telescope/telescope.nvim',
		},
	},
})
