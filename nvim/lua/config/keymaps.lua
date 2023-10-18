local keymap = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }

-- Indent w/o loosing selection
keymap("v", ">", ">gv", default_opts)
keymap("v", "<", "<gv", default_opts)

-- Resize windows windows
keymap("n", "<Left>", ":vertical resize +1<CR>", default_opts)
keymap("n", "<Right>", ":vertical resize -1<CR>", default_opts)
keymap("n", "<Up>", ":resize -1<CR>", default_opts)
keymap("n", "<Down>", ":resize +1<CR>", default_opts)

-- Inspect syntax group under cursor
keymap("n", "<F2>", ":Inspect<CR>", default_opts)

-- Go to alternate file
keymap("n", "<BS>", ":e #<cr>", default_opts)

-- OLD:

-- Trouble
-- vim.cmd([[map <F1> :TroubleToggle<cr>]])

-- Colorizer
-- vim.cmd([[map <F3> :ColorizerToggle<cr>]])

-- Markdown preview
-- vim.cmd([[nmap <F5> <Plug>MarkdownPreviewToggle<cr>]])

-- MKDX
-- vim.cmd([[nmap <C-Space> :call mkdx#ToggleCheckboxState(1)<cr>]])
