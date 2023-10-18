return {
  {
    "williamboman/mason.nvim",
    opts = {},
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
          openFileSOnly = true,
          python = {
            analysis = {
              stubPath = vim.fn.stdpath("data") .. "/lazy/python-type-stubs",
              diagnosticMode = "workspace",
              autoSearchPaths = true,
              useLibraryCodeForTypes = true,
              -- diagnosticMode = "openFilesOnly",
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
  },
  { "microsoft/python-type-stubs" },
}
