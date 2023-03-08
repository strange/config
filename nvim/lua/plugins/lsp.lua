local lspconfig = require("lspconfig")
local configs = require("lspconfig/configs")

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

local on_attach = function(client, bufnr)
	-- client.server_capabilities.document_formatting = false
	vim.opt.formatexpr = ""

	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
	vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
	vim.keymap.set("n", "<space>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)
	vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
	vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
	vim.keymap.set("n", "<space>f", function()
		vim.lsp.buf.format({ async = true })
	end, bufopts)

	vim.cmd([[
    autocmd CursorHold <buffer> lua show_line_diagnostics()
  ]])
end

local lsp_flags = {
  debounce_text_changes = 150,
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Mason

require('mason').setup()
local mason_lspconfig = require 'mason-lspconfig'

local servers = {
  tsserver = {},
  pyright = {},
  rust_analyzer = {},
  jsonls = {
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
}

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
    }
  end,
}

-- Comment out below --- 8< ---

-- lspconfig.jsonls.setup({
-- 	on_attach = on_attach,
--   flags = lsp_flags,
-- 	schemas = {
-- 		{
-- 			fileMatch = { "package.json" },
-- 			url = "https://json.schemastore.org/package.json",
-- 		},
-- 		{
-- 			fileMatch = { ".eslintrc.json", ".eslintrc" },
-- 			url = "http://json.schemastore.org/eslintrc",
-- 		},
-- 		{
-- 			fileMatch = { "tsconfig.json", "tsconfig.*.json" },
-- 			url = "http://json.schemastore.org/tsconfig",
-- 		},
-- 		{
-- 			fileMatch = { "jsconfig.json", "jsconfig.*.json" },
-- 			url = "https://json.schemastore.org/jsconfig.json",
-- 		},
-- 	},
-- })
--
-- lspconfig.eslint.setup({
-- 	on_attach = on_attach,
--   flags = lsp_flags,
-- })
--
-- lspconfig.pylsp.setup({
-- 	filetypes = { "python" },
-- 	on_attach = on_attach,
--   capabilities = capabilities,
--   flags = lsp_flags,
-- 	settings = {
-- 		configurationSources = { "flake8" },
-- 		formatCommand = { "black" },
-- 	},
-- })
--
-- lspconfig.tsserver.setup({
-- 	on_attach = on_attach,
--   flags = lsp_flags,
--   capabilities = capabilities,
--   settings = {
--     completions = {
--       completeFunctionCalls = true,
--     }
--   }
-- })
--
-- lspconfig.yamlls.setup({
-- 	on_attach = on_attach,
--   flags = lsp_flags,
-- 	settings = {
-- 		yaml = {
-- 			schemas = {
-- 				["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "docker-compose.{yml,yaml}",
-- 			},
-- 			schemaDownload = { enable = true },
-- 			validate = true,
-- 		},
-- 	},
-- })
--
-- lspconfig.rust_analyzer.setup({
-- 	on_attach = on_attach,
--   flags = lsp_flags,
-- })

vim.diagnostic.config({
  flags = lsp_flags,
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
