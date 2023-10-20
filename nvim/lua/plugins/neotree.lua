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
						-- folder_closed = "🡺",
						-- folder_closed = "›",
						-- folder_closed = "▸",
						-- folder_closed = "▶",
						folder_open = "-",
						-- folder_open = "🡻",
						-- folder_open = "▼",
						-- folder_empty = "Ø",
						folder_empty = "×",
						-- folder_empty = "▷",
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
						hide_gitignore = true,
					},
					use_libuv_file_watcher = true,
					hijack_netrw_behavior = "open_current",
					window = {
						mappings = {
							["<2-LeftMouse>"] = "open",
							["<cr>"] = "open",
							["S"] = "open_split",
							["s"] = "open_vsplit",
							["C"] = "close_node",
							["-"] = "navigate_up",
							["."] = "set_root",
							["H"] = "toggle_hidden",
							["I"] = "toggle_gitignore",
							["R"] = "refresh",
							["/"] = "fuzzy_finder",
							["f"] = "filter_on_submit",
							["<c-x>"] = "clear_filter",
							["a"] = "add",
							["d"] = "delete",
							["r"] = "rename",
							["c"] = "copy_to_clipboard",
							["x"] = "cut_to_clipboard",
							["p"] = "paste_from_clipboard",
							["m"] = "move",
							["q"] = "close_window",
						},
					},
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
