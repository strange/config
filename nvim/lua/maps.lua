-- Indent w/o loosing selection
vim.cmd([[vnoremap > >gv]])
vim.cmd([[vnoremap < <gv]])

-- Space as leader
vim.cmd([[map <Space> <Leader>]])

-- Find syntax group under cursor
vim.cmd([[map <F2> :TSHighlightCapturesUnderCursor<cr>]])
