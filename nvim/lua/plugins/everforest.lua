vim.cmd([[
  hi Normal guibg=#1f2224 guifg=#d6cbb2
  hi NormalNC guibg=#1f2224 guifg=#d6cbb2
  hi EndOfBuffer guibg=#1f2224

  " Inverted
  " hi! link String Yellow
  " hi! link TSString Yellow
  " hi! link Type Aqua
  " hi! link TSType Aqua
  " hi! link TSParameter Blue
  " hi! link TSConstBuiltin Purple

  " Brackets
  " hi! link TSPunctBracket Grey

  " NeoTree
  hi link NeoTreeDirectoryName Green
  hi link NeoTreeDirectoryIcon Grey
  hi link NeoTreeRootName Grey
  hi! link NeoTreeNormal Normal
  hi! link NeoTreeNormalNC Normal
  hi! link NeoTreeEndOfBuffer Normal

  hi IndentBlanklineChar guifg=#363c40 gui=nocombine

  " hi! @keyword.function guifg=#e0806c
  " hi! @keyword guifg=#e0806c
  " hi! @conditional guifg=#e0806c


  " hi! Keyword guifg=#a3747a
  " hi! @conditional guifg=#a3747a
  " hi! Type guifg=#7bab93
  " hi! @field guifg=#7baba2
  " hi! @variable guifg=#7baba2
  " hi! @include guifg=#ab7b95
]])
