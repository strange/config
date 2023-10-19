return {
  {
    "stevearc/conform.nvim",
    event = "BufReadPre",
    opts = {
      formatters_by_ft = {
        javascript = { "prettierd", "prettier" },
        javascriptreact = { "prettierd", "prettier" },
        typescript = { "prettierd", "prettier" },
        typescriptreact = { "prettierd", "prettier" },
        lua = { "stylua" },
        rust = { "rustfmt" },
        markdown = { "mdformat" },
        python = { "isort", "black" },
      },
      format_on_save = {
        timeout_ms = 15000, -- prettier can be really slow in some projects.
        lsp_fallback = true,
      },
    },
  },
}
