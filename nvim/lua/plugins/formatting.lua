return {
  "stevearc/conform.nvim",
  enabled = true,
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "isort", "black" },
        rust = { "rustfmt" },
        html = { { "prettierd", "prettier" } },
        markdown = { { "prettierd", "prettier" } },
        javascript = { { "prettierd", "prettier" }, "eslint_d" },
        javascriptreact = { { "prettierd", "prettier" }, "eslint_d" },
        typescript = { { "prettierd", "prettier" }, "eslint_d" },
        typescriptreact = { { "prettierd", "prettier" }, "eslint_d" },
      },
      format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 20000,
        lsp_fallback = true,
      },
    })

    -- vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
}
