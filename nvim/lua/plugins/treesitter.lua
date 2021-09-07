require('nvim-treesitter.configs').setup {
  ensure_installed = {"lua"},
  highlight = {
    enable = true,
    -- disable = {"javascript", "python"},
    custom_captures = {
      ["function.name"] = "Title",
    },
  },
}
