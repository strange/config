local function toggle_replace()
	local view = require("nvim-tree.view")
	if view.is_visible() then
		view.close()
	else
		require("nvim-tree").open_replacing_current_buffer()
	end
end

vim.g.nvim_tree_icon_padding = ""
vim.g.nvim_tree_icons = {
	default = "",
	symlink = "",
	folder = {
		arrow_open = "-",
		arrow_closed = "+",
		default = "",
		open = "",
		empty = "",
		empty_open = "",
		symlink = "",
		symlink_open = "",
	},
}

require("nvim-tree").setup({
	-- disable_netrw = false,
	hijack_netrw = true,
	git = {
		enable = false,
	},
	actions = {
		open_file = {
			quit_on_open = true,
		},
	},
	view = {
		signcolumn = "no",
		mappings = {
			list = {
				-- { key = "<CR>", action = "edit_in_place" },
				{ key = "<C-CR>", action = "edit" },
			},
		},
	},
})

vim.cmd([[
  nnoremap <leader>t :NvimTreeToggle<CR>
]])

require("which-key").register({
	["-"] = {
		function()
			local view = require("nvim-tree.view")
			local bufname = vim.fn.expand("%")
			if view.is_visible() then
				view.close()
			elseif bufname == "" then
				vim.cmd("e .")
			else
				require("nvim-tree").open_replacing_current_buffer()
			end
		end,
		"NvimTree in place",
	},
})
