vim.cmd [[packadd packer.nvim]]

require('options')
require('maps')
require('au')

require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  --- General
  use 'tpope/vim-vinegar'
  use 'tpope/vim-commentary'
  use 'tpope/vim-surround'
  use 'tpope/vim-ragtag'
  use 'tpope/vim-fugitive'
  use 'editorconfig/editorconfig-vim'
  use 'farmergreg/vim-lastplace'
  use 'gelguy/wilder.nvim'
  use 'brooth/far.vim'

  -- Notes
  use { 'vimwiki/vimwiki', config = "require('plugins.vimwiki')" }

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ":TSUpdate",
    config = "require('plugins.treesitter')",
  }
  -- use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'nvim-treesitter/playground'

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    config = "require('plugins.telescope')",
    requires = { 'nvim-lua/plenary.nvim' },
  }
  use {
    "AckslD/nvim-neoclip.lua",
    requires = { 'tami5/sqlite.lua', module = 'sqlite' },
    config = "require('plugins.neoclip')",
  }

  -- Language support
  use 'MaxMEllon/vim-jsx-pretty'
  use 'yuezk/vim-js'
  use 'Vimjas/vim-python-pep8-indent'
  use { 'plasticboy/vim-markdown', config = function()
    vim.g.vim_markdown_folding_disabled = 1
  end}
  use {
    "ellisonleao/glow.nvim",
    run = "GlowInstall",
    ft = { 'markdown' },
  } -- Markdown previews

  -- LSP and completion
  use { 'hrsh7th/vim-vsnip', config = "require('plugins.vsnip')" }
  use { 'neovim/nvim-lspconfig', config = "require('plugins.lsp')" }
  use {
    'hrsh7th/nvim-cmp',
    config = "require('plugins.cmp')",
    requires = {
      { 'hrsh7th/cmp-vsnip', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
    },
  }
  use { 'folke/trouble.nvim', config = function() 
    require("trouble").setup {
      icons=false,
    }
    vim.cmd([[nmap <leader>q :TroubleToggle<cr>]])
  end}

  -- Visual
  use { 'rktjmp/lush.nvim' }
  use {
    'lukas-reineke/indent-blankline.nvim',
    config = "require('plugins.blankline')",
  }
  use {
    'DarwinSenior/nvim-colorizer.lua',
    config = "require('plugins.colorizer')",
  }

  use {
    'jnurmine/Zenburn',
    config = "require('plugins.zenburn')",
  }

  use {
    'sainnhe/everforest',
    -- config = "require('plugins.everforest')",
  }
end)
