return {
  {
    "stevearc/conform.nvim",
    event = "BufReadPre",
    enabled = false,
    opts = {
      formatters_by_ft = {
        javascript = { "prettier" },
        javascriptreact = { "prettier" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
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
