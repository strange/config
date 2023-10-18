return {
  {
    "sainnhe/gruvbox-material",
    config = function()
      vim.g.gruvbox_material_background = "medium"
      vim.g.gruvbox_material_foreground = "material"
      vim.g.gruvbox_material_enable_italic = 1
      vim.g.gruvbox_material_better_performance = 1
      vim.g.gruvbox_material_transparent_background = 1
      vim.cmd([[color gruvbox-material]])
      vim.cmd([[
        hi IblIndent guifg=#303030 gui=nocombine
        hi MatchParen guifg=#fe8019 guibg=#282828 gui=nocombine
      ]])
    end,
  },
}
