return {
  {
    "AckslD/nvim-neoclip.lua",
    dependencies = { "tami5/sqlite.lua" },
    opts = {
      history = 10,
      preview = true,
      content_spec_column = true,
      default_register = "*",
      enable_persistent_history = true,
      keys = {
        telescope = {
          i = {
            paste_behind = "<c-b>",
          },
        },
      },
    },
  },
}

-- vim.cmd([[noremap <leader>p <cmd>lua require('telescope').extensions.neoclip.default()<cr>]])
