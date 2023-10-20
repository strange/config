return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		config = function()
			local wk = require("which-key")

			wk.setup({})

			-- Normal, leader prefix

			wk.register({
				l = { "<cmd>Lazy<CR>", "Plugin Manager" },
				e = { "<cmd>Telescope find_files<cr>", "Files" },
				h = { "<cmd>Telescope oldfiles<cr>", "Recent files" },
				t = { "<cmd>Neotree reveal toggle<cr>", "Neotree" },
				f = {
					name = "Find ...",
					a = { "<cmd>AerialToggle!<cr>", "Aerial" },
					b = { "<cmd>Telescope buffers<cr>", "Buffers" },
					c = { "<cmd>Telescope commands<cr>", "Commands" },
					f = { "<cmd>Telescope find_files<cr>", "Files" },
					F = { "<cmd>Telescope find_files hidden=true<cr>", "Files (hidden)" },
					g = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
					G = { "<cmd>Telescope grep_string<cr>", "Grep String" },
					h = { "<cmd>Telescope help_tags<cr>", "Help" },
					i = { "<cmd>Telescope highlights<cr>", "Highlights" },
					j = { "<cmd>Telescope oldfiles<cr>", "Recent files" },
					p = { "<cmd>Telescope neoclip<cr>", "Clipboard" },
					k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
					l = { "<cmd>Telescope lsp_document_symbols<cr>", "LSP Symbols" },
					m = { "<cmd>Telescope marks<cr>", "Marks" },
					r = { "<cmd>Telescope resume<cr>", "Resume" },
					s = { "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>", "Current Buffer" },
					z = { "<cmd>ZkNotes { sort = { 'modified' } }<cr>", "Zk Notes" },
					Z = { "<cmd>ZkTags<cr>", "Zk Tags" },
				},
			}, { mode = "n", prefix = "<leader>" })

			-- Normal, no prefix

			wk.register({
				["<F3>"] = { "<cmd>TroubleToggle document_diagnostics<cr>", "Trouble" },
				["<F4>"] = { "<cmd>ToggleTerm direction=float<cr>", "Terminal" },
				["<F5>"] = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Trouble" },
				["<F6>"] = { "<cmd>MarkdownPreviewToggle<cr>", "Markdown preview" },
				["-"] = { "<cmd>:Neotree reveal current<cr>", "Browse current directory" },
			}, { mode = "n" })

			-- Terminal, no prefix

			wk.register({
				["<F4>"] = { "<c-n><cmd>ToggleTerm direction=float<cr>", "Terminal" },
			}, { mode = "t" })

			-- Visual, no prefix

			wk.register({
				["<Enter>"] = { [["+y]], "Copy to clipboard" },
			}, { mode = "v" })
		end,
	},
}
