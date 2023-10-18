
return {
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    config = function()
      local actions = require("telescope.actions")

      require("telescope").setup({
        defaults = {
          mappings = {
            i = {
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
            },
          },
          file_ignore_patterns = {
            -- "dist/*",
            -- "__pycache__/*",
            -- "node_modules/*",
            -- "env/*",
          },
        },
      })
    end,
  },
}
