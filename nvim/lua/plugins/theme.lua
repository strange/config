return {
	{
		"sainnhe/gruvbox-material",
		config = function()
			vim.g.gruvbox_material_background = "medium"
			vim.g.gruvbox_material_foreground = "material"
			vim.g.gruvbox_material_enable_italic = 1
			vim.g.gruvbox_material_better_performance = 1
			vim.g.gruvbox_material_transparent_background = 1

			vim.api.nvim_create_autocmd("ColorScheme", {
				pattern = "gruvbox-material",
				callback = function()
					vim.api.nvim_set_hl(0, "IblIndent", { fg = "#303030" })
					vim.api.nvim_set_hl(0, "MatchParen", { fg = "#fe8019" })
				end,
				group = vim.api.nvim_create_augroup("ModifyGruvbox", { clear = true }),
			})

			vim.cmd("color gruvbox-material")
		end,
	},
}
