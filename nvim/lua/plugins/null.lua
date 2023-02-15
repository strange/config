local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local lsp_formatting = function(bufnr)
	vim.lsp.buf.format({
		filter = function(client)
			-- apply whatever logic you want (in this example, we'll only use null-ls)
			return client.name == "null-ls"
		end,
		bufnr = bufnr,
	})
end

require("null-ls").setup({
	sources = {
		require("null-ls").builtins.formatting.stylua,
		-- require("null-ls").builtins.diagnostics.eslint,
		require("null-ls").builtins.diagnostics.flake8,
		require("null-ls").builtins.completion.spell,
		-- require("null-ls").builtins.formatting.deno_fmt.with({
		-- 	extra_args = { "--options-single-quote", "--options-line-width=100" },
		-- }),
		-- require("null-ls").builtins.formatting.prettier.with({
		-- 	extra_args = { "--single-quote" },
		-- }),
		-- require("null-ls").builtins.formatting.eslint,
		require("null-ls").builtins.formatting.fixjson,
		require("null-ls").builtins.formatting.isort,
		-- require("null-ls").builtins.formatting.autopep8.with({
		-- 	extra_args = { "--aggressive", "--aggressive" },
		-- }),
		-- require("null-ls").builtins.formatting.yapf,
		require("null-ls").builtins.formatting.black.with({
			extra_args = { "--preview" },
		}),
		-- require("null-ls").builtins.diagnostics.eslint,
		-- require("null-ls").builtins.completion.spell,
	},
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({
						filter = function(client)
							-- apply whatever logic you want (in this example, we'll only use null-ls)
							return client.name == "null-ls"
						end,
						bufnr = bufnr,
					})
					-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
					-- vim.lsp.buf.formatting_sync()
				end,
			})
		end
	end,
})
