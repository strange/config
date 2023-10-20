-- Notable keybindings:
--
-- gl - show diagnostics
-- F2 - rename
-- K - display info about symbol
-- go - go to definition
-- gr - display all references to the symbol
-- ]d and [d - go to next/prev diagnostic

return {
	{
		"VonHeikemen/lsp-zero.nvim",
		dependencies = {
			"creativenull/efmls-configs-nvim",
			"neovim/nvim-lspconfig",
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"microsoft/python-type-stubs",
		},
		branch = "v3.x",
		config = function()
			local lsp_zero = require("lsp-zero")
			local lspconfig = require("lspconfig")

			require("mason").setup({})
			require("mason-lspconfig").setup({})

			-- Keymaps

			lsp_zero.on_attach(function(client, bufnr)
				lsp_zero.default_keymaps({
					buffer = bufnr,
					preserve_mappings = false,
					exclude = { "<F3>", "<F4>" },
				})
			end)

			-- Diagnostic settings

			vim.diagnostic.config({
				virtual_text = false,
				severity_sort = true,
			})

			-- LSP servers

			lspconfig.pyright.setup({
				settings = {
					python = {
						analysis = {
							stubPath = vim.fn.stdpath("data") .. "/lazy/python-type-stubs",
						},
					},
				},
			})

			lspconfig.lua_ls.setup({
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			})
			lspconfig.tsserver.setup({})
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

			-- EFM setup

			local eslint = require("efmls-configs.linters.eslint_d")
			local prettier = require("efmls-configs.formatters.prettier")
			local stylua = require("efmls-configs.formatters.stylua")
			local black = require("efmls-configs.formatters.black")
			local isort = require("efmls-configs.formatters.isort")
			local rustfmt = require("efmls-configs.formatters.rustfmt")

			local languages = {
				javascript = { eslint, prettier },
				javascriptreact = { eslint, prettier },
				lua = { stylua },
				python = { black, isort },
				rust = { rustfmt },
				typescript = { eslint, prettier },
				typescriptreact = { eslint, prettier },
			}

			require("lspconfig").efm.setup(vim.tbl_extend("force", {
				filetypes = vim.tbl_keys(languages),
				settings = {
					rootMarkers = { ".git/" },
					languages = languages,
				},
				init_options = {
					documentFormatting = true,
					documentRangeFormatting = true,
				},
			}, {
				-- on_attach = on_attach,
				-- capabilities = capabilities,
			}))

			-- Format on save

			vim.api.nvim_create_autocmd("BufWritePost", {
				group = vim.api.nvim_create_augroup("LspFormattingGroup", {}),
				callback = function(ev)
					local efm = vim.lsp.get_active_clients({ name = "efm", bufnr = ev.buf })

					if vim.tbl_isempty(efm) then
						return
					end

					vim.lsp.buf.format({ name = "efm", timeout_ms = 20000 })
				end,
			})
		end,
	},
	{
		"folke/trouble.nvim",
		opts = {
			icons = false,
		},
	},
}
