return {
  { "farmergreg/vim-lastplace" },
  { "tpope/vim-ragtag" },
  { "tpope/vim-fugitive" },
  { "tpope/vim-surround" },
  { "brooth/far.vim" },
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
    }
  },
}
