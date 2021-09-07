vim.o.background = "dark"
vim.o.cursorline = true -- see highlights below

vim.g.nord_italic = 1
vim.g.nord_italic_comments = 1
vim.g.nord_underline = 1

vim.cmd([[colorscheme nord]])
vim.cmd([[hi Normal guibg=#171c23]])
-- vim.cmd([[hi Constant guifg=#a093c7]])
vim.cmd([[hi Include guifg=#a093c7]])
vim.cmd([[hi Title guifg=#e2a478]])
vim.cmd([[hi Title guifg=#d9a67e]])
vim.cmd([[hi String guifg=#91be9b]])
vim.cmd([[hi CursorLineNr guifg=#81a1c1]])
vim.cmd([[hi Pmenu guibg=#28303c]])

vim.cmd([[hi! clear CursorLine]])

vim.cmd([[hi! link jsFunctionName Title]])
vim.cmd([[hi! link jsTemplateBrace Function]])
vim.cmd([[hi! link jsDocTags Function]])
vim.cmd([[hi! link jsDocIdentifier Type]])
vim.cmd([[hi! link jsDocModuleName Type]])
vim.cmd([[hi! link jsDocBraces Type]])

vim.cmd([[hi! link pythonFunction Title]])
vim.cmd([[hi! link pythonBuiltin Include]])
vim.cmd([[hi! link pythonBuiltinFunc Type]])

vim.cmd([[hi! link erlangAtom Function]])

vim.cmd([[hi! link rustFuncName Title]])
vim.cmd([[hi! link rustBoolean Number]])
vim.cmd([[hi! link rustSigil Number]])

vim.cmd([[hi! link VimwikiHeader1 Title]])
vim.cmd([[hi! link VimwikiHeader2 Title]])
vim.cmd([[hi! link VimwikiHeader3 Title]])
vim.cmd([[hi! link VimwikiHeader4 Title]])
vim.cmd([[hi! link VimwikiHeader5 Title]])
vim.cmd([[hi! link VimwikiHeader6 Title]])

vim.cmd([[hi! link markdownCodeBlock PreProc]])
vim.cmd([[hi! link markdownH1 Title]])
vim.cmd([[hi! link markdownH2 Title]])
vim.cmd([[hi! link markdownH3 Title]])
vim.cmd([[hi! link markdownH4 Title]])
vim.cmd([[hi! link markdownH5 Title]])
vim.cmd([[hi! link markdownH6 Title]])

vim.cmd([[hi! link shVariable Function]])
vim.cmd([[hi! link shDerefSimple Function]])
vim.cmd([[hi! link shOption Title]])

vim.cmd([[hi! link shOption Title]])

vim.cmd([[hi! link TSInclude Include]])
vim.cmd([[hi! link TSBoolean Number]])

-- vim.cmd([[hi! link erlangBracket Title]])
vim.cmd([[hi! link erlangGlobalFuncCall Include]])
