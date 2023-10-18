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
-- lspconfig.pyright.setup {}
-- lspconfig.pylsp.setup {}
-- lspconfig.jedi_language_server.setup {}
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

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)

function show_line_diagnostics()
  local opts = {
    focusable = false,
    close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
    border = "rounded",
    source = "always",
    prefix = " ",
  }
  vim.diagnostic.open_float(nil, opts)
end

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    -- client.server_capabilities.document_formatting = false
    vim.opt.formatexpr = ""
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
    vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set("n", "<space>wl", function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
    vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "<space>f", function()
      vim.lsp.buf.format({ async = true })
    end, opts)

    vim.cmd([[autocmd CursorHold <buffer> lua show_line_diagnostics()]])
  end,
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

-- Mason

-- require('mason').setup()
-- local mason_lspconfig = require 'mason-lspconfig'

-- local servers = {
--   tsserver = {},
--   pyright = {},
--   rust_analyzer = {},
--   jsonls = {
--     json = {
--       schemas = {
--         {
--           fileMatch = { "package.json" },
--           url = "https://json.schemastore.org/package.json",
--         },
--         {
--           fileMatch = { ".eslintrc.json", ".eslintrc" },
--           url = "http://json.schemastore.org/eslintrc",
--         },
--         {
--           fileMatch = { "tsconfig.json", "tsconfig.*.json" },
--           url = "http://json.schemastore.org/tsconfig",
--         },
--         {
--           fileMatch = { "jsconfig.json", "jsconfig.*.json" },
--           url = "https://json.schemastore.org/jsconfig.json",
--         },
--       },
--       validate = { enable = true },
--     },
--   },
-- }

-- mason_lspconfig.setup {
--   ensure_installed = vim.tbl_keys(servers),
-- }
--
-- mason_lspconfig.setup_handlers {
--   function(server_name)
--     require('lspconfig')[server_name].setup {
--       capabilities = capabilities,
--       on_attach = on_attach,
--       settings = servers[server_name],
--     }
--   end,
-- }

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
