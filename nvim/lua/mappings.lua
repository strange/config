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

vim.cmd([[
  aunmenu PopUp.How-to\ disable\ mouse
  aunmenu PopUp.-1-
]])

-- Mouse
-- vim.cmd([[
--   vnoremap <LeftMouse> y
--   vnoremap <RightMouse> d
--   noremap <MiddleMouse> <LeftMouse>P
--   inoremap <MiddleMouse> <esc><LeftMouse>Pi
--
--   vnoremap <C-LeftMouse> "+y
--   vnoremap <C-RightMouse> "+d
--   noremap <C-MiddleMouse> <LeftMouse>"+P
--   inoremap <C-MiddleMouse> <esc><LeftMouse>"+Pi
--
--   noremap <A-MiddleMouse> *
--   vnoremap <A-MiddleMouse> *
--   noremap <A-2-MiddleMouse> *
--   vnoremap <A-2-MiddleMouse> *
--   noremap <A-3-MiddleMouse> *
--   vnoremap <A-3-MiddleMouse> *
--   noremap <A-4-MiddleMouse> *
--   vnoremap <A-4-MiddleMouse> *
--
--   noremap <A-S-LeftMouse> <LeftMouse><Esc><C-V>
--   noremap <A-S-LeftDrag> <LeftDrag>
-- ]])
