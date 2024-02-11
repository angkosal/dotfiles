local actions = require('telescope.actions')

-- require('telescope').setup({
local options = {
	defaults = {
		file_ignore_patterns = { 'node_modules' },
		mappings = {
			i = {
				['<C-j>'] = actions.move_selection_next,
				['<C-k>'] = actions.move_selection_previous,
			},
		},
	},
	extensions = {
		media_files = {
			-- filetypes whitelist
			-- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
			-- filetypes = { 'png', 'webp', 'jpg', 'jpeg' },
			find_cmd = 'rg', -- find command (defaults to `fd`)
		},
	},
}

return options
