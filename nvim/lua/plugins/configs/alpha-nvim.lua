-----------------------------------------------------------
-- Dashboard configuration file
-----------------------------------------------------------

-- Plugin: alpha-nvim
-- url: https://github.com/goolord/alpha-nvim

-- For configuration examples see: https://github.com/goolord/alpha-nvim/discussions/16

-- local alpha = require('alpha')
local dashboard = require('alpha.themes.dashboard')

-- Footer
local function footer()
	-- local version = vim.version()
	-- local print_version = 'v' .. version.major .. '.' .. version.minor .. '.' .. version.patch
	-- local datetime = os.date('%Y/%m/%d %H:%M:%S')
	--
	-- return print_version .. ' ' .. datetime

	local stats = require('lazy').stats()
	local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
	return '⚡ Neovim loaded ' .. stats.loaded .. '/' .. stats.count .. ' plugins in ' .. ms .. 'ms'
end

-- Banner
local banner = {
	'                                             ',
	' ██╗  ██╗ ██████╗ ███████╗ █████╗ ██╗        ',
	' ██║ ██╔╝██╔═══██╗██╔════╝██╔══██╗██║        ',
	' █████╔╝ ██║   ██║███████╗███████║██║        ',
	' ██╔═██╗ ██║   ██║╚════██║██╔══██║██║        ',
	' ██║  ██╗╚██████╔╝███████║██║  ██║███████╗   ',
	' ╚═╝  ╚═╝ ╚═════╝ ╚══════╝╚═╝  ╚═╝╚══════╝   ',
	'                                             ',
}

dashboard.section.header.val = banner

-- Menu
dashboard.section.buttons.val = {
	dashboard.button('n', ' New file', ':ene <BAR> startinsert<CR>'),
	dashboard.button('f', ' Find file', ':Telescope find_files<CR>'),
	dashboard.button('s', ' Settings', ':e $MYVIMRC<CR>'),
	dashboard.button('u', ' Update plugins', ':Lazy update<CR>'),
	dashboard.button('q', ' Quit', ':qa<CR>'),
}

dashboard.section.footer.val = footer()

return dashboard.config
-- alpha.setup(dashboard.config)
