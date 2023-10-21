return {
	-- Restore cursor position
	{ "farmergreg/vim-lastplace", event = { "BufReadPre" } },

	-- Symbol navigation
	{
		"stevearc/aerial.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
		enabled = true,
		keys = {
			{
				"<leader>fa",
				"<cmd>AerialToggle!<cr>",
				desc = "Aerial",
				silent = true,
				remap = false,
			},
		},
		config = function()
			require("aerial").setup({
				on_attach = function(bufnr)
					vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
					vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
				end,
				layout = {
					min_width = 30,
					default_direction = "prefer_left",
				},
			})
		end,
	},

	-- Git stuff
	{
		"tpope/vim-fugitive",
		event = { "BufReadPost" },
	},

	-- Split/join blocks of code
	{
		"Wansmer/treesj",
		enabled = true,
		keys = { "<space>m", "<space>j", "<space>s" },
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("treesj").setup({})
		end,
	},

	-- Modify surrounding characters
	{
		"tpope/vim-surround",
		event = { "InsertEnter" },
	},

	-- Split/join blocks of code
	{
		"echasnovski/mini.nvim",
		enabled = true,
		config = function()
			require("mini.splitjoin").setup()
		end,
	},

	-- Indent guides
	{
		"lukas-reineke/indent-blankline.nvim",
		enabled = true,
		main = "ibl",
		event = "BufReadPost",
		opts = {
			scope = {
				enabled = false,
			},
		},
	},
}
