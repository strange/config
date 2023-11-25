return {
  {
    "nvim-treesitter/nvim-treesitter",
    enabled = true,
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    -- event = "BufReadPre",
    build = ":TSUpdate",
    config = function()
      local configs = require("nvim-treesitter.configs")
      configs.setup({
        highlight = {
          enable = true,
          -- additional_vim_regex_highlighting = true,
        },
        indent = {
          enable = true,
        },
        ensure_installed = {
          "bash",
          "comment",
          "css",
          "dockerfile",
          "erlang",
          "html",
          "javascript",
          "json",
          "lua",
          "markdown",
          "markdown_inline",
          "python",
          "regex",
          "rego",
          "rust",
          "scss",
          "toml",
          "tsx",
          "typescript",
          "vim",
          "yaml",
        },
      })
    end,
  },
}
