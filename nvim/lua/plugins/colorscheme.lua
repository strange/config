return {
	{
		"sainnhe/gruvbox-material",
		lazy = false,
		priority = 1000,
		enabled = true,
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
					-- vim.api.nvim_set_hl(0, "CustomString", { fg = "#ecbd6e" })
					-- vim.api.nvim_set_hl(0, "String", { link = "Yellow" })
					-- vim.api.nvim_set_hl(0, "@string", { link = "Yellow" })
					-- vim.api.nvim_set_hl(0, "@type.python", { link = "GreenItalic" })
				end,
				group = vim.api.nvim_create_augroup("ModifyGruvbox", { clear = true }),
			})

			vim.cmd("color gruvbox-material")
		end,
	},
	{
		"savq/melange-nvim",
		lazy = false,
		priority = 1000,
		enabled = false,
		config = function()
			vim.cmd("color melange")
		end,
	},
	{
		"AlexvZyl/nordic.nvim",
		lazy = false,
		priority = 1000,
		enabled = false,
		config = function()
			-- local C = require("nordic.colors")

			require("nordic").setup({
				on_palette = function(palette)
					-- palette.white = "#ff9900"
					-- palette.gray5 = "#ff9900"
					return palette
				end,
				transparent_bg = true,
				bright_border = false,
				override = {
					-- Comment = { fg = C.green.base },
				},
				telescope = {
					-- Available styles: `classic`, `flat`.
					style = "classic",
				},
				ts_context = {
					dark_background = true,
				},
			})

			vim.cmd("color nordic")
		end,
	},
}
