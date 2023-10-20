return {
  {
    "mickael-menu/zk-nvim",
    config = function()
      require("zk").setup({
        picker = "telescope",
        auto_attach = {
          enabled = true,
          filetypes = { "markdown" },
        },
      })
    end,
  },
}
