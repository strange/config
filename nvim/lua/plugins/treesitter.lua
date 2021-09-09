require('nvim-treesitter.configs').setup {
  ensure_installed = {"lua"},
  highlight = {
    enable = true,
    disable = {"html"},
    custom_captures = {
      ["function.name"] = "Title",
    },
  },
}
