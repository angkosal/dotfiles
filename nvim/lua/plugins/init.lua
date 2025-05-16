-----------------------------------------------------------
-- Plugin manager configuration file
-----------------------------------------------------------

-- Plugin manager: lazy.nvim
-- url: https://github.com/folke/lazy.nvim

-- For information about installed plugins see the README
--- neovim-lua/README.md
--- https://github.com/brainfucksec/neovim-lua#readme

-- Add packages
local configs = {
	-- use('wbthomason/packer.nvim') -- packer can manage itself
	'nvim-lua/plenary.nvim',
	-- File explorer
	{
		'kyazdani42/nvim-tree.lua',
		cmd = 'NvimTreeToggle',
		opts = function()
			return require('plugins.configs.nvim-tree')
		end,
		config = function(_, opts)
			require('nvim-tree').setup(opts)
		end,
	},
	{
		'vhyrro/luarocks.nvim',
		priority = 1000, -- Very high priority is required, luarocks.nvim should run as the first plugin in your config.
		config = true,
	},
	-- Indent line
	'lukas-reineke/indent-blankline.nvim',

	-- Autopair
	{
		'windwp/nvim-autopairs',
		event = 'InsertEnter',
		config = function()
			require('nvim-autopairs').setup()
		end,
	},
	-- Icons
	'kyazdani42/nvim-web-devicons',
	{
		'echasnovski/mini.icons',
		lazy = true,
		opts = {
			file = {
				['.keep'] = { glyph = '󰊢', hl = 'MiniIconsGrey' },
				['devcontainer.json'] = { glyph = '', hl = 'MiniIconsAzure' },
			},
			filetype = {
				dotenv = { glyph = '', hl = 'MiniIconsYellow' },
			},
		},
		init = function()
			package.preload['nvim-web-devicons'] = function()
				require('mini.icons').mock_nvim_web_devicons()
				return package.loaded['nvim-web-devicons']
			end
		end,
	},

	-- Tag viewer
	-- 'liuchengxu/vista.vim',

	-- Treesitter interface
	{
		'nvim-treesitter/nvim-treesitter',
		-- lazy = false,
		run = ':TSUpdate',
		opts = function()
			return require('plugins.configs.nvim-treesitter')
		end,
		config = function(_, opts)
			require('nvim-treesitter.install').compilers = { 'clang' }
			require('nvim-treesitter.configs').setup(opts)
		end,
	},
	{ 'nvim-treesitter/nvim-treesitter-textobjects' },

	-- Color schemes
	'bluz71/vim-nightfly-guicolors',
	{ 'ellisonleao/gruvbox.nvim', priority = 1000, config = true },

	-- LSP
	{
		'williamboman/mason.nvim',
		lazy = false,
		opts = function()
			return require('plugins.configs.mason')
		end,
		config = function(_, opts)
			require('mason').setup(opts)
		end,
	},
	{
		'williamboman/mason-lspconfig.nvim',
		lazy = false,
		opts = function()
			return require('plugins.configs.mason-lspconfig')
		end,
		config = function(_, opts)
			require('mason-lspconfig').setup(opts.options)
			require('mason-lspconfig').setup_handlers(opts.setup_handlers)
		end,
	},
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
		lazy = false,
		dependencies = {
			'L3MON4D3/LuaSnip',
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-buffer',
			'saadparwaiz1/cmp_luasnip',
		},
		opts = function()
			return require('plugins.configs.nvim-cmp')
		end,
		config = function(_, opts)
			require('cmp').setup(opts)
		end,
	},
	{
		'monkoose/neocodeium',
		event = 'VeryLazy',
		config = function()
			local neocodeium = require('neocodeium')
			neocodeium.setup()
			vim.keymap.set('i', '<C-j>', neocodeium.accept)
		end,
	},

	-- Statusline
	{
		'nvim-lualine/lualine.nvim',
		opts = function()
			return require('plugins.configs.lualine')
		end,
		config = function(_, opts)
			require('lualine').setup(opts)
		end,
	},

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
		lazy = false,
		requires = { 'kyazdani42/nvim-web-devicons' },
		opts = function()
			return require('plugins.configs.alpha-nvim')
		end,
		config = function(_, opts)
			require('alpha').setup(opts)
		end,
	},

	{
		'nvim-telescope/telescope.nvim',
		requires = { { 'nvim-lua/plenary.nvim' } },
		cmd = 'Telescope',
		opts = function()
			return require('plugins.configs.telescope')
		end,
		config = function(_, opts)
			require('telescope').setup(opts)
		end,
	},
	{
		'numToStr/Comment.nvim',
		lazy = false,
		config = function()
			require('Comment').setup()
		end,
	},
	-- {
	-- 	'akinsho/flutter-tools.nvim',
	-- 	config = function()
	-- 		require('flutter-tools').setup({})
	-- 	end,
	-- },

	{
		'kdheepak/lazygit.nvim',
		cmd = 'LazyGit',
		config = function(_, opts)
			require('plugins.configs.lazygit')
		end,
	},

	{ 'rafamadriz/friendly-snippets' },
	--use {"github/copilot.vim"}
	{
		'codota/tabnine-nvim',
		build = require('plugins.configs.tabnine').build_path(),
		opts = function()
			return require('plugins.configs.tabnine')
		end,
		config = function(_, opts)
			require('tabnine').setup(opts)
		end,
	},
	-- {
	-- 	'jpmcb/nvim-llama',
	-- 	config = function(_, opts)
	-- 		require('nvim-llama').setup({})
	-- 	end,
	-- },
	{
		'folke/which-key.nvim',
		event = 'VeryLazy',
		opts = function()
			return require('plugins.configs.which-key')
		end,
		config = function(_, opts)
			require('which-key').setup(opts.options)
			require('which-key').add(opts.register, { prefix = '<leader>' })
		end,
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
}

require('lazy').setup(configs, {
	defaults = { lazy = true },
	performance = {
		cache = { enabled = true },
	},
})
