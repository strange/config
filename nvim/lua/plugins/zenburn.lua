vim.g.zenburn_high_Contrast = 1
vim.g.zenburn_alternate_Visual = 1

vim.cmd([[colorscheme zenburn]])

vim.cmd([[
hi Normal guibg=#111111

hi Underlined guifg=#8cb0d3
hi Title guifg=#ffcfaf
" hi Number guifg=#a9ced1
hi LineNr guifg=#555555
hi TSString guifg=#d08e8e

hi link TSConstant TSConstructor
hi link TSFunction TSTypeBuiltin
hi link TSMethod TSTypeBuiltin
hi link TSType Function
hi TSTag guifg=#efef8f gui=italic

hi Todo guifg=#ccdc90 guibg=#313633
hi PmenuSel guifg=#111111 guibg=#ffd7a7

hi pythonTSType guifg=#e8c282
]])
