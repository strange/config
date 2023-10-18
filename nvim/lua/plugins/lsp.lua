return {
  {
    "williamboman/mason.nvim",
    opts = {
      -- ensure_installed = {
      --   "stylua",
      --   "shellcheck",
      --   "shfmt",
      --   "flake8",
      --   "lua_ls",
      -- },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "lua_ls",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      vim.diagnostic.config({
        flags = {
          debounce_text_changes = 150,
        },
        virtual_text = false,
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
      })

      local signs = { Error = "×", Warn = "×", Hint = "×", Info = "×" }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end

      local lspconfig = require("lspconfig")

      lspconfig.pyright.setup({
        settings = {
          python = {
            analysis = {
              autoSearchPaths = true,
              useLibraryCodeForTypes = false,
              diagnosticMode = "openFilesOnly",
            },
          },
        },
      })

      lspconfig.lua_ls.setup({})
      lspconfig.tsserver.setup({})
      lspconfig.eslint.setup({})
      lspconfig.rust_analyzer.setup({})
      lspconfig.jsonls.setup({
        json = {
          json = {
            schemas = {
              {
                fileMatch = { "package.json" },
                url = "https://json.schemastore.org/package.json",
              },
              {
                fileMatch = { ".eslintrc.json", ".eslintrc" },
                url = "http://json.schemastore.org/eslintrc",
              },
              {
                fileMatch = { "tsconfig.json", "tsconfig.*.json" },
                url = "http://json.schemastore.org/tsconfig",
              },
              {
                fileMatch = { "jsconfig.json", "jsconfig.*.json" },
                url = "https://json.schemastore.org/jsconfig.json",
              },
            },
            validate = { enable = true },
          },
        },
      })
    end,
    -- opts = {
    --   servers = {
    --    jsonls = {},
    --    pyright = {},
    --   },
    -- },
  },
  -- {
  --   "nvim-lua/lsp-status.nvim",
  --   event = "BufReadPre",
  -- },
  -- {
  --   "williamboman/mason.nvim",
  --   event = "BufReadPre",
  --   dependencies = {
  --     "williamboman/mason-lspconfig.nvim",
  --     "neovim/nvim-lspconfig",
  --   },
  --   build = ":MasonUpdate",
  --   config = function()
  --     -- require("lsp").setup()
  --   end,
  -- },

  -- {
  --   "mihyaeru21/nvim-lspconfig-bundler",
  --   event = "BufReadPre",
  --   dependencies = {
  --     "neovim/nvim-lspconfig",
  --   },
  --   config = function()
  --     -- require("lspconfig-bundler").setup()
  --   end,
  -- },
}
