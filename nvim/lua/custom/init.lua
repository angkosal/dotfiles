-- This is where your custom modules and plugins go.
-- See the wiki for a guide on how to extend NvChad

local hooks = require "core.hooks"

-- NOTE: To use this, make a copy with `cp example_init.lua init.lua`

-- vim.api.nvim_set_keymap('i', '<C-BS>', '<Esc>caw', {noremap = true, silent = true})
-- local api = vim.opt
-- vim.opt.backspace = "indent,eol,start"
--------------------------------------------------------------------

-- To modify packaged plugin configs, use the overrides functionality
-- if the override does not exist in the plugin config, make or request a PR,
-- or you can override the whole plugin config with 'chadrc' -> M.plugins.default_plugin_config_replace{}
-- this will run your config instead of the NvChad config for the given plugin

-- hooks.override("lsp", "publish_diagnostics", function(current)
--   current.virtual_text = false;
--   return current;
-- end)

-- To add new mappings, use the "setup_mappings" hook,
-- you can set one or many mappings
-- example below:

-- set difference tab default 2
vim.api.nvim_command('autocmd BufEnter *.php setlocal shiftwidth=4')
vim.api.nvim_command('autocmd BufEnter *.py setlocal shiftwidth=4')

hooks.add("setup_mappings", function(map)
--    map("n", "<leader>cc", "gg0vG$d", opt) -- example to delete the buffer
--    .... many more mappings ....
  map("n", "tn", ":tabnew<CR>:Telescope find_files<CR>", opt) -- open new tab and find files
  map("n", "<Tab>", "%", opt)
  map("v", "<Tab>", "%", opt)
  map("i", "<C-H>", "<C-W>", {noremap = true})

  map("n", "<M-j>", ":resize -2<CR>", opt)
  map("n", "<M-k>", ":resize +2<CR>", opt)
  map("n", "<M-h>", ":vertical resize -2<CR>", opt)
  map("n", "<M-l>", ":vertical resize +2<CR>", opt)
  map("n", "<space>fm", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  map("v", "<C-r>", "\"hy:%s/<C-r>h//gc<left><left><left>", opts)
  for i = 1, 9 do
    map("n", "<leader>"..i, ":"..i.."tabnext<CR>", opt) -- example to delete the buffer
  end

  map('n', '<Leader>r', [[<cmd>lua require'rest-nvim'.run()<cr>]], {noremap = true, silent = true})
end)

-- To add new plugins, use the "install_plugin" hook,
-- NOTE: we heavily suggest using Packer's lazy loading (with the 'event' field)
-- see: https://github.com/wbthomason/packer.nvim
-- examples below:


hooks.add("install_plugins", function(use)
  --    use {
  --       "max397574/better-escape.nvim",
  --       event = "InsertEnter",
  --    }

  -- use {
  --   "github/copilot.vim",
  -- }

  use {
    "jose-elias-alvarez/null-ls.nvim",
    after = "nvim-lspconfig",
    config = function()
      require("custom.plugin_confs.null-ls").setup()
    end,
  }

  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup {
      }
    end
  }

  use {
    'TimUntersberger/neogit',
    cmd = 'Neogit',
    config = function()
      require("custom.plugin_confs.neogit").setup()
    end 
  } 

  use {
    'sindrets/diffview.nvim',
    requires = 'nvim-lua/plenary.nvim'
  }

  use {
    "NTBBloodbath/rest.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      -- <Plug>RestNvim, run the request under the cursor
      -- <Plug>RestNvimPreview, preview the request cURL command
      -- <Plug>RestNvimLast, re-run the last request
      require("rest-nvim").setup({
        -- Open request results in a horizontal split
        result_split_horizontal = false,
        -- Skip SSL verification, useful for unknown certificates
        skip_ssl_verification = false,
        -- Highlight request on run
        highlight = {
          enabled = true,
          timeout = 150,
        },
        -- Jump to request line on run
        jump_to_request = false,
      })
    end
  }
end)

-- alternatively, put this in a sub-folder like "lua/custom/plugins/mkdir"
-- then source it with

-- require "custom.plugins.mkdir"

