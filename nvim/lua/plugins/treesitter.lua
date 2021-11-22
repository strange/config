require('nvim-treesitter.configs').setup {
  ensure_installed = "all",
  highlight = {
    enable = true,
    -- disable = {"html"},
    custom_captures = {
      ["function.name"] = "FunctionName",
    },
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
    colors = {
      "#eb6f92",
      "#3e8fb0",
      "#9ccfd8",
      "#c4a7e7"
    }
  }
}
