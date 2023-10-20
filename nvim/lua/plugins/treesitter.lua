return {
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
		event = "BufReadPre",
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				highlight = {
					enable = true,
					-- additional_vim_regex_highlighting = true,
				},
				indent = {
					enable = true,
				},
				context_commentstring = {
					enable = true,
				},
				ensure_installed = {
					"bash",
					"comment",
					"dockerfile",
					"erlang",
					"html",
					"javascript",
					"json",
					"lua",
					"markdown",
					"markdown_inline",
					"python",
					"regex",
					"rego",
					"rust",
					"scss",
					"toml",
					"typescript",
					"vim",
					"yaml",
				},
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		event = "BufReadPre",
		dependencies = "nvim-treesitter/nvim-treesitter",
	},
}
