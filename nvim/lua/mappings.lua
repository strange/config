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

-- OLD:

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

-- MKDX
-- vim.cmd([[nmap <C-Space> :call mkdx#ToggleCheckboxState(1)<cr>]])
