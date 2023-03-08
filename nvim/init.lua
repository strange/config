require("options")
require("mappings")
require("au")

require("packer").startup(function()
	use("wbthomason/packer.nvim")

	--- General
	-- use("tpope/vim-commentary")
	-- use({
	-- 	"numToStr/Comment.nvim",
	-- 	config = function()
	-- 		require("Comment").setup()
	-- 		local ft = require("Comment.ft")
	-- 		ft.set("scss", "// %s")
	-- 	end,
	-- })
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})
	use("tpope/vim-surround")
	use("tpope/vim-ragtag")
	use("tpope/vim-fugitive")
	use("editorconfig/editorconfig-vim")
	use("farmergreg/vim-lastplace")
	use("brooth/far.vim")

	-- Deps
	use("MunifTanjim/nui.nvim")
	use("nvim-lua/plenary.nvim")

	-- Notes
	-- use({ "vimwiki/vimwiki", config = "require('plugins.vimwiki')" })

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		config = "require('plugins.treesitter')",
	})
	use("nvim-treesitter/playground")
	use("JoosepAlviste/nvim-ts-context-commentstring")

	use({ "numToStr/FTerm.nvim" })
	require("FTerm").setup({
		border = "single",
		dimensions = {
			height = 0.9,
			width = 0.9,
		},
	})

	-- Telescope
	use({
		"nvim-telescope/telescope.nvim",
		config = "require('plugins.telescope')",
	})
	use({
		"AckslD/nvim-neoclip.lua",
		requires = { "tami5/sqlite.lua", module = "sqlite" },
		config = "require('plugins.neoclip')",
	})

	-- Misc
	use({
		"nvim-neo-tree/neo-tree.nvim",
		branch = "main",
		config = "require('plugins.neotree')",
	})

	-- Language support
	use("neoclide/vim-jsx-improve")
	use("Vimjas/vim-python-pep8-indent")
	use("SidOfc/mkdx")
	use({
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
		setup = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	})

	-- LSP and completion
	use({ "mickael-menu/zk-nvim", config = "require('plugins.zk')" })
	use({ "jose-elias-alvarez/null-ls.nvim", config = "require('plugins.null')" })

	use({ "hrsh7th/vim-vsnip", config = "require('plugins.vsnip')" })

  use { "williamboman/mason.nvim" }
  use { "williamboman/mason-lspconfig.nvim" }
	use({ "neovim/nvim-lspconfig", config = "require('plugins.lsp')" })
  use { 'folke/neodev.nvim' }

	use({ "hrsh7th/cmp-buffer" })
	use({ "hrsh7th/cmp-cmdline" })
	use({ "hrsh7th/cmp-nvim-lsp" })
	use({ "hrsh7th/cmp-nvim-lua" })
	use({ "hrsh7th/cmp-path" })
	use({ "hrsh7th/cmp-vsnip" })
	use({ "hrsh7th/nvim-cmp", config = "require('plugins.cmp')" })

	use({
		"folke/trouble.nvim",
		cmd = {
			"Trouble",
			"TroubleToggle",
		},
		config = function()
			require("trouble").setup({
				icons = false,
			})
		end,
	})

	-- Visual
	use({
		"lukas-reineke/indent-blankline.nvim",
		config = "require('plugins.blankline')",
	})
	use({
		"oncomouse/nvim-colorizer.lua",
		config = "require('plugins.colorizer')",
	})

	-- Theme
	use({
		"sainnhe/everforest",
		config = function()
			-- vim.cmd([[color everforest]])
			-- require("plugins.everforest")
		end,
	})
	use({
		"sainnhe/gruvbox-material",
		config = function()
      vim.g.gruvbox_material_background = 'hard'
      vim.g.gruvbox_material_foreground = 'material'
      vim.g.gruvbox_material_enable_italic = 1
      vim.g.gruvbox_material_better_performance = 1
      vim.g.gruvbox_material_transparent_background = 1
			vim.cmd([[color gruvbox-material]])
      vim.cmd([[
        hi IndentBlanklineChar guifg=#303030 gui=nocombine
      ]])
		end,
	})
end)

require('neodev').setup()
