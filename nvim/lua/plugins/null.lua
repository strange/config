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

local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.stylua,
    -- null_ls.builtins.diagnostics.eslint,
    null_ls.builtins.diagnostics.flake8,
    -- null_ls.builtins.completion.spell,
    -- null_ls.builtins.formatting.deno_fmt.with({
    -- 	extra_args = { "--options-single-quote", "--options-line-width=100" },
    -- }),
    -- null_ls.builtins.formatting.prettier,
    -- null_ls.builtins.formatting.prettier.with({
    -- 	extra_args = { "--single-quote" },
    -- }),
    null_ls.builtins.formatting.eslint,
    null_ls.builtins.formatting.fixjson,
    null_ls.builtins.formatting.isort,
    -- null_ls.builtins.formatting.autopep8.with({
    -- 	extra_args = { "--aggressive", "--aggressive" },
    -- }),
    -- null_ls.builtins.formatting.yapf,
    null_ls.builtins.formatting.black.with({
      extra_args = { "--preview" },
    }),
    -- null_ls.builtins.diagnostics.eslint,
    -- null_ls.builtins.completion.spell,
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
