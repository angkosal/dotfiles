
return {
  {"ellisonleao/glow.nvim"}, -- markdown previewer
  { "williamboman/nvim-lsp-installer", },
  {
    "jose-elias-alvarez/null-ls.nvim",
    after = "nvim-lspconfig",
    config = function()
      require("custom.plugin_confs.null-ls").setup()
    end,
  },
  -- {
  --   "folke/which-key.nvim",
  --   config = function()
  --     require("which-key").setup {
  --     }
  --   end
  -- },
  {
    'TimUntersberger/neogit',
    cmd = 'Neogit',
    config = function()
      require("custom.plugin_confs.neogit").setup()
    end 
  }, 
  {
    'sindrets/diffview.nvim',
    requires = 'nvim-lua/plenary.nvim'
  },
  {
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
}

