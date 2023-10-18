return {
  {
    "farmergreg/vim-lastplace",
    event = { "BufReadPre" },
  },
  {
    "tpope/vim-ragtag",
    event = { "InsertEnter" },
  },
  {
    "tpope/vim-fugitive",
    event = { "BufReadPost" },
  },
  {
    "tpope/vim-surround",
    event = { "InsertEnter" },
  },
  {
    "echasnovski/mini.nvim",
    event = { "BufReadPost" },
    config = function()
      require("mini.splitjoin").setup()
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = "BufReadPost",
    opts = {
      scope = {
        enabled = false,
      },
      -- exclude = {
      --   filetypes = {
      --     "help",
      --     "terminal",
      --     "starter",
      --     "nvim-tree",
      --     "packer",
      --     "lspinfo",
      --     "TelescopePrompt",
      --     "TelescopeResults",
      --     "mason",
      --     "",
      --   },
      -- },
      -- exclude = { "help", "text", "terminal", "nofile" },
      -- filetype_exclude = { "help", "text" },
      -- use_treesitter = true,
      -- show_first_indent_level = false,
      -- show_current_context = true,
      -- show_current_context_start = true,
    },
  },
}
