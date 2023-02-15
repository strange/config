local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()

require("nvim-treesitter.configs").setup({
	highlight = {
		enable = true,
		custom_captures = {
			["function.name"] = "FunctionName",
		},
		-- Need to enable in order for jsx indentation to work properly.
		-- additional_vim_regex_highlighting = true,
	},
	indent = {
		enable = true,
		disable = { "python" },
	},
	context_commentstring = {
		enable = true,
	},
	autotag = {
		enable = true,
	},
	--   incremental_selection = {
	--     enable = true,
	--     keymaps = {
	--       init_selection = "gnn",
	--       -- node_incremental = "grn",
	--       -- scope_incremental = "grc",
	--       -- node_decremental = "grm",

	--       scope_incremental = '<CR>',
	--       node_incremental = '<Tab>',
	--       node_decremental = '<S-Tab>',
	--     },
	--   },
})
