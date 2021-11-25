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
