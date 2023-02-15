require("indent_blankline").setup({
	buftype_exclude = { "terminal", "nofile" },
	filetype_exclude = { "packer", "help", "text" },
	use_treesitter = true,
	show_first_indent_level = false,
	-- show_current_context = true,
	-- show_current_context_start = true,
})

-- vim.cmd [[highlight IndentBlanklineChar guifg=#00FF00 gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineContextChar guifg=#ff9900 gui=nocombine]]
-- vim.cmd([[
--   au VimEnter * highlight IndentBlanklineChar guifg=#282828 gui=nocombine
-- ]])
