-- IMPORTANT NOTE : This is the user config, can be edited. Will be preserved if updated with internal updater
-- This file is for NvChad options & tools, custom settings are split between here and 'lua/custom/init.lua'

local M = {}
M.options, M.ui, M.mappings, M.plugins = {}, {}, {}, {}

-- NOTE: To use this, make a copy with `cp example_chadrc.lua chadrc.lua`


--------------------------------------------------------------------

-- To use this file, copy the structure of `core/default_config.lua`,
-- examples of setting relative number & changing theme:

M.options = {
  relativenumber = true,
  mouse = "nv",
}

M.ui = {
  -- theme = "gruvchad",
  theme = "everforest",
  transparency = true,
}

M.mappings = {
  close_buffer = {"<leader>d", "<leader>x"},
   -- file explorer/tree
  window_nav = {
    moveLeft = {"<C-h>","th"},
    moveRight = {"<C-l>","tl"},
    moveUp = {"<C-k>","tk"},
    moveDown = {"<C-j>","tj"},
  },
  better_escape = { -- <ESC> will still work
    esc_insertmode = { "jk", "jj", "kj" }, -- multiple mappings allowed
  },
  nvimtree = {
     toggle = "<leader>e",
     focus = "<C-n>",
   },
}

M.mappings.plugins = {
  better_escape = { -- <ESC> will still work
    esc_insertmode = { "jk", "jj", "kj" }, -- multiple mappings allowed
  },
  nvimtree = {
     toggle = "<leader>e",
     focus = "<C-n>",
   },
  telescope = {
    find_files = {"<leader>ff", "<c-p>"},
    git_commits = "<leader>gm",
    git_status = "<leader>gs",
  }
}

-- NvChad included plugin options & overrides
M.plugins = {
   options = {
      lspconfig = {
      --    path of file containing setups of different lsps (ex : "custom.plugins.lspconfig"), read the docs for more info
        setup_lspconf = "custom.plugin_confs.lspconfig",
      },
      nvimtree = {
         enable_git = 1,
      },
   },
   status = {
      colorizer = true,
      truezen = true,
      bufferline = false
   },
   -- To change the Packer `config` of a plugin that comes with NvChad,
   -- add a table entry below matching the plugin github name
   --              '-' -> '_', remove any '.lua', '.nvim' extensions
   -- this string will be called in a `require`
   --              use "(custom.configs).my_func()" to call a function
   --              use "custom.blankline" to call a file
   default_plugin_config_replace = {},
}

return M

