-----------------------------------------------------------
-- File manager configuration file
-----------------------------------------------------------

-- Plugin: nvim-tree
-- url: https://github.com/kyazdani42/nvim-tree.lua

--- Keybindings are defined in `core/keymaps.lua`:
--- https://github.com/kyazdani42/nvim-tree.lua#keybindings

--- Note: options under the g: command should be set BEFORE running the
--- setup function: https://github.com/kyazdani42/nvim-tree.lua#setup
--- Default options ARE NOT included.
--- See: `:help NvimTree`

-- Call setup
--- each of these are documented in `:help nvim-tree.OPTION_NAME`
-- require('nvim-tree').setup({
local options = {
	filters = {
		dotfiles = false,
		exclude = { 'custom' },
	},
	disable_netrw = true,
	hijack_netrw = true,
	open_on_tab = false,
	hijack_cursor = true,
	hijack_unnamed_buffer_when_opening = false,
	update_cwd = true,
	update_focused_file = {
		enable = true,
		update_cwd = false,
	},
	view = {
		side = 'left',
		width = 25,
	},
	git = {
		enable = false,
		ignore = true,
	},
	actions = {
		open_file = {
			resize_window = true,
		},
	},
	renderer = {
		highlight_git = false,
		highlight_opened_files = 'none',
		root_folder_label = false,
		indent_markers = {
			enable = false,
		},
		icons = {
			padding = ' ',
			symlink_arrow = ' ➛ ',
			show = {
				file = true,
				folder = true,
				folder_arrow = true,
				git = false,
			},
			glyphs = {
				default = '',
				symlink = '',
				folder = {
					default = '',
					empty = '',
					empty_open = '',
					open = '',
					symlink = '',
					symlink_open = '',
					arrow_open = '',
					arrow_closed = '',
				},
				git = {
					unstaged = '✗',
					staged = '✓',
					unmerged = '',
					renamed = '➜',
					untracked = '★',
					deleted = '',
					ignored = '◌',
				},
			},
		},
	},
}

return options;
