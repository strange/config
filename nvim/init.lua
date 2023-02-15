vim.cmd([[packadd packer.nvim]])

require("options")
require("mappings")
require("au")

require("packer").startup(function()
	use("wbthomason/packer.nvim")

	--- General
	-- use("tpope/vim-vinegar")
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
	-- use({
	-- 	"b3nj5m1n/kommentary",
	-- 	config = function()
	-- 		require("kommentary.config").configure_language("default", {
	-- 			prefer_single_line_comments = true,
	-- 		})
	-- 		require("kommentary.config").configure_language("scss", {
	-- 			prefer_single_line_comments = true,
	-- 		})
	-- 		require("kommentary.config").configure_language("javascript", {
	-- 			prefer_single_line_comments = true,
	-- 		})
	-- 		require("kommentary.config").configure_language("javascriptreact", {
	-- 			prefer_single_line_comments = true,
	-- 		})
	-- 	end,
	-- })
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
	use({ "vimwiki/vimwiki", config = "require('plugins.vimwiki')" })

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		-- run = ":TSUpdate",
		config = "require('plugins.treesitter')",
	})
	use("nvim-treesitter/playground")
	use("JoosepAlviste/nvim-ts-context-commentstring")

	-- use({ "folke/which-key.nvim" })
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
	-- use({
	-- 	"luukvbaal/stabilize.nvim",
	-- 	config = function()
	-- 		require("stabilize").setup()
	-- 	end,
	-- })

	use({
		"nvim-neo-tree/neo-tree.nvim",
		-- branch = "v1.x",
		branch = "main",
		config = "require('plugins.neotree')",
	})
	-- use({
	-- 	"kyazdani42/nvim-tree.lua",
	-- 	config = "require('plugins.nvimtree')",
	-- })

	-- Language support
	use("neoclide/vim-jsx-improve")
	use("Vimjas/vim-python-pep8-indent")
	-- use { 'plasticboy/vim-markdown', config = function()
	--   vim.g.vim_markdown_folding_disabled = 1
	--   vim.g.vim_markdown_conceal = 0
	--   vim.g.vim_markdown_conceal_code_blocks = 0
	--   vim.g.vim_markdown_new_list_item_indent = 2
	--   vim.g.vim_markdown_frontmatter = 1
	-- ende
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
	use({ "neovim/nvim-lspconfig", config = "require('plugins.lsp')" })
	use({ "hrsh7th/vim-vsnip", config = "require('plugins.vsnip')" })
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
	-- use({
	-- 	"NvChad/nvim-colorizer.lua",
	-- 	config = "require('colorizer').setup()",
	-- })

	-- Theme
	-- vim.cmd([[color dracula]])
	use({
		"sainnhe/everforest",
		config = function()
			vim.cmd([[color everforest]])
			require("plugins.everforest")
		end,
	})

	use({
		"catppuccin/nvim",
		as = "catppuccin",
		config = function()
			-- vim.cmd([[color catpuccin]])
		end,
	})

	use({
		"nyoom-engineering/oxocarbon.nvim",
		config = function()
			-- vim.cmd([[color oxocarbon]])
		end,
	})

	use({
		"mcchrish/zenbones.nvim",
		config = function()
			-- vim.cmd([[color zenbones]])
			-- vim.cmd([[color kanagawabones]])
			-- vim.cmd([[color seoulbones]])
			-- vim.cmd([[color neobones]])
			-- vim.cmd([[
			--      hi Normal guibg=#1f2224
			--      hi NormalNC guibg=#1f2224
			--    ]])
		end,
	})

	use({
		"savq/melange",
		config = function()
			-- vim.cmd([[color melange]])
		end,
	})

	use({
		"rebelot/kanagawa.nvim",
		config = function()
			-- vim.cmd([[color kanagawa]])
			-- vim.cmd([[
			--      hi Normal guibg=#1f2224
			--      hi NormalNC guibg=#1f2224
			--    ]])
		end,
	})

	use({
		"Domeee/mosel.nvim",
		config = function()
			-- vim.cmd("colorscheme mosel")
			-- vim.cmd([[hi Normal guibg=#111111]])
			-- vim.cmd([[hi NormalNC guibg=#111111]])
		end,
	})

	use({
		"EdenEast/nightfox.nvim",
		config = function()
			-- vim.cmd("colorscheme carbonfox")
			-- vim.cmd([[
			--    hi Normal guibg=#1f2224
			-- hi NormalNC guibg=#1f2224
			--    hi StatusLine guibg=#313633 guifg=#ccdc90
			--    hi StatusLineNC guibg=#2e3330 guifg=#88b090
			--    ]])
		end,
	})

	use({
		"meliora-theme/neovim",
		requires = { "rktjmp/lush.nvim" },
		config = function()
			-- vim.cmd("colorscheme meliora")
		end,
	})

	use({
		"tomasiser/vim-code-dark",
		requires = { "rktjmp/lush.nvim" },
		config = function()
			-- vim.cmd("colorscheme codedark")
		end,
	})

	use({
		"lewpoly/sherbet.nvim",
		config = function()
			-- vim.cmd("colorscheme sherbet")
		end,
	})

	use({
		"w3barsi/barstrata.nvim",
		config = function()
			-- vim.cmd("colorscheme barstrata")
			-- vim.cmd([[hi Normal guibg=#111111]])
			-- vim.cmd([[hi NormalNC guibg=#111111]])
		end,
	})

	use({
		"kvrohit/substrata.nvim",
		config = function()
			vim.g.substrata_variant = "brighter"
			-- vim.cmd("colorscheme substrata")
			-- vim.cmd([[hi Normal guibg=#111111]])
			-- vim.cmd([[hi NormalNC guibg=#111111]])
		end,
	})

	use({
		"luisiacc/gruvbox-baby",
		config = function()
			-- vim.cmd("colorscheme gruvbox-baby")
		end,
	})

	-- use({
	--   'rose-pine/neovim',
	--   as = 'rose-pine',
	--   tag = 'v1.*',
	--   config = function()
	--     vim.cmd('colorscheme rose-pine')
	--     vim.cmd([[hi Normal guibg=#111111]])
	--     vim.cmd([[hi NormalNC guibg=#111111]])
	--   end
	-- })

	-- use({
	-- 	"jnurmine/Zenburn",
	-- config = "require('plugins.zenburn')",
	-- })
	-- vim.cmd[[colorscheme default3]]

	-- use {
	--   "phha/zenburn.nvim",
	--  config = function()
	--    require("zenburn").setup()
	-- vim.cmd([[
	-- hi Normal guibg=#111111
	-- hi LineNr guibg=#111111
	-- " hi LineNr guifg=#555555
	-- " hi VertSplit guifg=#555555
	--    hi StatusLine guibg=#213633 guifg=#ccdc90
	--    hi StatusLineNC guibg=#1e3330 guifg=#88b090
	--    ]])
	--  end
	-- }

	-- use({
	-- 	"ishan9299/modus-theme-vim",
	-- 	config = function()
	-- 		vim.g.modus_dim_inactive_window = 0
	-- 		vim.g.modus_green_strings = 0
	-- 		vim.g.modus_faint_syntax = 0
	-- 		vim.g.modus_yellow_comments = 0
	-- 		vim.cmd("colorscheme modus-vivendi")
	-- 		vim.cmd([[
	--      hi LineNr guifg=#555555
	--      hi VertSplit guifg=#555555
	--      hi IndentBlanklineChar guifg=#333333 gui=nocombine
	--      hi Normal guibg=#111111
	--      hi NormalNC guibg=#111111
	--      " hi StatusLine guibg=#313633 guifg=#ccdc90
	--      " hi StatusLineNC guibg=#2e3330 guifg=#88b090
	--     ]])
	-- 	end,
	-- })
end)
