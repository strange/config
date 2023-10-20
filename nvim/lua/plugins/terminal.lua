return {
  -- {
  --   "numToStr/FTerm.nvim",
  --   config = function()
  --     require("FTerm").setup({
  --       dimensions = {
  --         height = 0.9,
  --         width = 0.9,
  --       },
  --     })
  --
  --     -- Example keybindings
  --     vim.keymap.set("n", "<A-i>", '<CMD>lua require("FTerm").toggle()<CR>')
  --     vim.keymap.set("t", "<A-i>", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
  --   end,
  -- },
  {
    "akinsho/toggleterm.nvim",
    event = "VeryLazy",
    config = function()
      require("toggleterm").setup({
        open_mapping = [[<c-\>]],
      })
    end,
  },
}
