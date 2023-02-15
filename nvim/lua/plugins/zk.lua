require("telescope").load_extension("zk")
require("zk").setup({
	create_user_commands = true,

	lsp = {
		config = {
			cmd = { "zk", "lsp" },
			name = "zk",
			-- init_options = ...
			-- on_attach = ...
			-- etc, see `:h vim.lsp.start_client()`
		},
		auto_attach = {
			enabled = true,
			filetypes = { "markdown" },
		},
	},
})

vim.api.nvim_set_keymap("n", "<Leader>zc", "<cmd>lua require('zk').new()<CR>", { noremap = true })

vim.api.nvim_set_keymap("x", "<Leader>zc", "<esc><cmd>lua require('zk').new_link()<CR>", { noremap = true })

-- Show Telescope pickers

vim.api.nvim_set_keymap(
	"n",
	"<Leader>zn",
	"<cmd>lua require('telescope').extensions.zk.notes()<CR>",
	{ noremap = true }
)

vim.api.nvim_set_keymap(
	"n",
	"<Leader>zo",
	"<cmd>lua require('telescope').extensions.zk.orphans()<CR>",
	{ noremap = true }
)

vim.api.nvim_set_keymap(
	"n",
	"<Leader>zb",
	"<cmd>lua require('telescope').extensions.zk.backlinks()<CR>",
	{ noremap = true }
)

vim.api.nvim_set_keymap(
	"n",
	"<Leader>zl",
	"<cmd>lua require('telescope').extensions.zk.links()<CR>",
	{ noremap = true }
)

vim.api.nvim_set_keymap("n", "<Leader>zt", "<cmd>lua require('telescope').extensions.zk.tags()<CR>", {
	noremap = true,
})
