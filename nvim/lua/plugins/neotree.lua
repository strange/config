return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		cmd = "Neotree",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
		},
		config = function()
			require("neo-tree").setup({
				enable_git_status = false,
				enable_diagnostics = false,
				use_popups_for_input = false,
				default_component_configs = {
					indent = {
						with_markers = false,
						padding = 0,
						indent_size = 1,
					},
					icon = {
						folder_closed = "+",
						folder_open = "-",
						folder_empty = "×",
						default = " ",
					},
					name = {
						trailing_slash = false,
						use_git_status_colors = true,
					},
				},
				filesystem = {
					filtered_items = {
						hide_dotfiles = false,
					},
					use_libuv_file_watcher = true,
					hijack_netrw_behavior = "open_current",
				},
			})

			vim.api.nvim_create_autocmd("ColorScheme", {
				pattern = "*",
				callback = function()
					vim.api.nvim_set_hl(0, "NeoTreeDirectoryName", { link = "Directory" })
					vim.api.nvim_set_hl(0, "NeoTreeDirectoryIcon", { link = "NeoTreeDirectoryName" })
				end,
				group = vim.api.nvim_create_augroup("LinkNeoTree", { clear = true }),
			})
		end,
	},
}
