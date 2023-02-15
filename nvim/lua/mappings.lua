-- Indent w/o loosing selection
vim.cmd([[vnoremap > >gv]])
vim.cmd([[vnoremap < <gv]])

-- Space as leader
vim.cmd([[map <Space> <Leader>]])

-- Find syntax group under cursor
vim.cmd([[map <F2> :TSHighlightCapturesUnderCursor<cr>]])

-- Wiki
vim.cmd([[map <leader>vv :e ~/notes/toc.md<cr>]])

-- Trouble
vim.cmd([[map <F1> :TroubleToggle<cr>]])

-- Colorizer
vim.cmd([[map <F3> :ColorizerToggle<cr>]])

-- Markdown preview
vim.cmd([[nmap <F5> <Plug>MarkdownPreviewToggle<cr>]])

-- Go to alternate file
vim.cmd([[map <BS> :e #<cr>]])

-- Terminal stuff
vim.cmd([[nmap <F4> <cmd>lua require('FTerm').toggle()<cr>]])
vim.cmd([[tmap <F4> <C-n><CMD>lua require('FTerm').toggle()<CR>]])
-- vim.cmd([[nmap <F5> <cmd>NvimTreeToggle<cr>]])
-- vim.cmd([[tmap <F5> <ESC>]])

-- MKDX
vim.cmd([[nmap <C-Space> :call mkdx#ToggleCheckboxState(1)<cr>]])

-- Mouse
vim.cmd([[
  vnoremap <LeftMouse> y
  vnoremap <RightMouse> d
  noremap <MiddleMouse> <LeftMouse>P
  inoremap <MiddleMouse> <esc><LeftMouse>Pi

  vnoremap <C-LeftMouse> "+y
  vnoremap <C-RightMouse> "+d
  noremap <C-MiddleMouse> <LeftMouse>"+P
  inoremap <C-MiddleMouse> <esc><LeftMouse>"+Pi

  noremap <A-MiddleMouse> *
  vnoremap <A-MiddleMouse> *
  noremap <A-2-MiddleMouse> *
  vnoremap <A-2-MiddleMouse> *
  noremap <A-3-MiddleMouse> *
  vnoremap <A-3-MiddleMouse> *
  noremap <A-4-MiddleMouse> *
  vnoremap <A-4-MiddleMouse> *

  noremap <A-S-LeftMouse> <LeftMouse><Esc><C-V>
  noremap <A-S-LeftDrag> <LeftDrag>
]])

function open_contextual_menu()
	-- getcurpos()	Get the position of the cursor.  This is like getpos('.'), but
	-- 		includes an extra "curswant" in the list:
	-- 		    [0, lnum, col, off, curswant] ~
	-- 		The "curswant" number is the preferred column when moving the
	-- 		cursor vertically.  Also see |getpos()|.
	-- 		The first "bufnum" item is always zero.
	local curpos = vim.fn.getpos(".")

	menu_opts = {
		kind = "menu",
		experimental_mouse = true,
		position = {
			screenrow = curpos[2],
			screencol = curpos[3],
		},
		width = 300,
		height = 300,
	}

	require("stylish").ui_menu(vim.fn.menu_get(""), menu_opts, function(res)
		print("### " .. res)
	end)
end

-- Context menu
vim.cmd([[
  amenu <silent> LSP.Go\ to\ definition <cmd>lua vim.lsp.buf.definition()<CR>
]])

-- noremap <silent> <A-S-RightMouse> <LeftMouse>:lua open_contextual_menu()<CR>
-- close menu when cursor leaves buffer
function open_lol_menu()
	local Menu = require("nui.menu")
	local event = require("nui.utils.autocmd").event
	local curpos = vim.fn.getpos(".")

	local menu = Menu({
		relative = "cursor",
		position = {
			row = 1,
			col = 0,
		},
		size = {
			width = 20,
			height = 2,
		},
		border = {
			style = "single",
			text = {
				top = "Choose Something",
				top_align = "center",
			},
		},
		win_options = {
			winblend = 10,
			winhighlight = "Normal:Normal",
		},
	}, {
		lines = {
			Menu.item("Item 1"),
			Menu.item("Item 2"),
			Menu.separator("Menu Group", {
				char = "-",
				text_align = "right",
			}),
			Menu.item("Item 3"),
		},
		max_width = 20,
		keymap = {
			focus_next = { "j", "<Down>", "<Tab>" },
			focus_prev = { "k", "<Up>", "<S-Tab>" },
			close = { "<Esc>", "<C-c>" },
			submit = { "<CR>", "<Space>" },
		},
		on_close = function()
			print("CLOSED")
		end,
		on_submit = function(item)
			print("SUBMITTED", vim.inspect(item))
		end,
	})

	menu:mount()
	menu:on(event.BufLeave, menu.menu_props.on_close, { once = true })
end

vim.cmd([[
  noremap <silent> <F8> <LeftMouse>:lua open_lol_menu()<cr>
]])
