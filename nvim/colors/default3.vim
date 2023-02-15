let s:theme = {}

let s:theme.snow = 'f5f3f0'

let s:theme.wheat = 'd6d2c9'
let s:theme.wheat = 'f0ede9'
let s:theme.wheat = 'f4f4f4'
let s:theme.wheat = 'd3c6aa'
let s:theme.wheat = 'e2d9c6'
" let s:theme.wheat = 'faf8e1'
let s:theme.darkwheat = 'aba8a0'
let s:theme.darkerwheat = '807e78'
let s:theme.darkestwheat = '555450'

let s:theme.lightestonyx = '5e6165'
let s:theme.lighteronyx = '464a4f'
let s:theme.lightonyx = '2f3439'
let s:theme.onyx = '14181c'
let s:theme.onyx = '111111'

let s:theme.green = 'a7c080'
" let s:theme.green = 'a6c77d'
" let s:theme.green = '7de075'
let s:theme.light_green = 'c0c9b3'
let s:theme.dark_green = '63b85c'
let s:theme.red = 'e67e80'
let s:theme.orange = 'e69875'
let s:theme.yellow = 'dbc77f'
let s:theme.light_yellow = 'dbbc7f'
" let s:theme.yellow = 'e6dc9c'
let s:theme.cyan = '83c092'
let s:theme.light_cyan = 'c5decb'
let s:theme.teal = '83c7c1'
let s:theme.blue = '57c2f7'
let s:theme.blue = '7fbbb3' " remove me
let s:theme.blue = '7fb8bb' " remove me
let s:theme.indigo = '8692d9'
let s:theme.magenta = 'd699b6'
" let s:theme.magenta = 'd690b1'
" let s:theme.magenta = 'e892be'

" Corrected colors
" let s:theme.green = '7EFF78'
" let s:theme.red = 'FF9485'
" let s:theme.orange = 'FFDB91'
" let s:theme.yellow = 'FFF191'
" let s:theme.cyan = '5EF1FF'
" let s:theme.teal = '35d6db'
" let s:theme.blue = '6BA4FF'
" let s:theme.magenta = 'FF79C6'
" let s:theme.indigo = '8692d9'

" Color conversion algorithm from:
" https://unix.stackexchange.com/questions/269077/tput-setaf-color-table-how-to-determine-color-codes
"
" Arguments: hex without hash
function! s:to8bit(hex)
    let r = str2nr(a:hex[0:1], 16)
    let g = str2nr(a:hex[2:3], 16)
    let b = str2nr(a:hex[4:5], 16)
    return (r < 75 ? 0 : (r - 35) / 40) * 6 * 6 +
          \(g < 75 ? 0 : (g - 35) / 40) * 6 +
          \(b < 75 ? 0 : (b - 35) / 40) + 16
endfunction

" Resolve color name
"
" Arguments: key of color in the theme dictionary or the special values `fg`
" and `bg`.
function! s:resolve(key)
    if a:key == 'fg' || a:key == 'bg'
        return [a:key, a:key]
    else
        let color = get(s:theme, a:key, '000000')
        return ['#' . color, s:to8bit(color)]
    endif
endfunction

" Generate highlight rule
"
" Arguments: group, [fg], [bg], [attrs]
" Example: HL('Normal', 'onyx', 'bg', 'bold,italic')
function! s:HL(group, ...)
    let histring = 'hi ' . a:group

    if a:0 >= 1
        let colors = s:resolve(a:1)
        let histring .= ' guifg=' . colors[0] . ' ctermfg=' . colors[1]
    endif

    if a:0 >= 2
        let colors = s:resolve(a:2)
        let histring .= ' guibg=' . colors[0] . ' ctermbg=' . colors[1]
    endif

    if a:0 >= 3
        let histring .= ' gui=' . a:3 . ' cterm=' . a:3
    else
        let histring .= ' cterm=NONE gui=NONE'
    endif

    " echom histring
    execute histring
endfunction

" customization

if exists('g:default_vivid_comments') && g:default_vivid_comments
    let s:comment_color = 'indigo'
else
    let s:comment_color = 'darkerwheat'
endif

if exists('g:default_respect_terminal_bg') && g:default_respect_terminal_bg
    let s:background_color = 'none'
else
    let s:background_color = 'onyx'
endif

if exists('g:default_italic_strings') && g:default_italic_strings
    let s:string_style = 'italic'
else
    let s:string_style = 'none'
endif

if exists('g:default_snazzy') && g:default_snazzy
    let s:function_color = 'blue'
    let s:number_color = 'green'
else
    let s:function_color = 'green'
    let s:number_color = 'blue'
endif

if exists('g:default_vivid_line_number') && g:default_vivid_line_number
    let s:line_number_color = 'yellow'
else
    let s:line_number_color = 'darkestwheat'
endif

" normal

call s:HL('Normal', 'wheat', s:background_color)
call s:HL('Identifier', 'wheat')

" syntax

call s:HL('PreProc', 'magenta')
call s:HL('Statement', 'magenta')
call s:HL('StorageClass', 'magenta')
call s:HL('Keyword', 'magenta')
call s:HL('Operator', 'magenta')
call s:HL('Conditional', 'magenta')

call s:HL('Type', 'cyan')
call s:HL('Exception', 'red')
call s:HL('Constant', 'blue')
call s:HL('Constant', 'blue')
call s:HL('Function', s:function_color)

call s:HL('Special', 'orange')
call s:HL('String', 'yellow', s:background_color, s:string_style)
call s:HL('Number', s:number_color)
call s:HL('Include', 'magenta')

" Treesitter
call s:HL('TSNumber', s:number_color)
call s:HL('TSKeyword', 'magenta')
call s:HL('TSString', 'yellow')
call s:HL('TSType', 'cyan')
call s:HL('TSField', 'light_green')
call s:HL('TSKeywordFunction', 'magenta')
call s:HL('TSConditional', 'magenta')

" UI

call s:HL('LineNr', s:line_number_color)
call s:HL('Visual', 'onyx', 'cyan')
call s:HL('CursorLineNr', 'yellow')

" Folds

call s:HL('Folded', 'cyan', 'lightonyx', 'italic')
call s:HL('FoldColumn', 'onyx', 'cyan', 'italic')

call s:HL('ColorColumn', 'fg', 'lightonyx')
call s:HL('VertSplit', 'lightonyx', 'lightonyx')
call s:HL('SignColumn', 'lightonyx', 'lightonyx')
call s:HL('NonText', 'lighteronyx')

call s:HL('StatusLine', 'onyx', 'wheat')
call s:HL('StatusLineNC', 'darkwheat', 'lightonyx')

call s:HL('Search', 'onyx', 'yellow')
call s:HL('SpecialKey', 'red')
call s:HL('Directory', 'blue')

" Menu

call s:HL('WildMenu', 'wheat', 'lightonyx')
call s:HL('Pmenu', 'wheat', 'lightonyx')
call s:HL('PmenuSel', 'onyx', 'blue')

" Misc

call s:HL('Title', 'teal')
call s:HL('Underlined', 'blue')

" Errors

call s:HL('Error', 'wheat', 'red')
call s:HL('ErrorMsg', 'wheat', 'red')

" Comments

call s:HL('Comment', 'darkerwheat')
call s:HL('Comment', s:comment_color)
call s:HL('Todo', 'blue', 'lightonyx')

" Coc

call s:HL('CocErrorSign', 'red', 'lightonyx')
call s:HL('CocWarningSign', 'orange', 'lightonyx')
call s:HL('CocInfoSign', 'blue', 'lightonyx')

" Vim

call s:HL('vimUserFunc', 'green')
call s:HL('vimFuncName', 'green')
call s:HL('vimOption', 'cyan')
call s:HL('vimCommentTitle', 'blue')
call s:HL('vimMapRhs', 'wheat')

" JS

call s:HL('jsGlobalObjects', 'cyan')
call s:HL('jsCatch', 'magenta')
call s:HL('jsTry', 'magenta')
call s:HL('jsNull', 'blue')
call s:HL('jsFunction', 'magenta')
call s:HL('jsArrowFunction', 'green')
call s:HL('jsClassMethodType', 'magenta')

" JSX

call s:HL('jsxComponentName', 'cyan')
call s:HL('jsxTagName', 'cyan')
call s:HL('jsxAttrib', 'green')
call s:HL('jsxOpenPunct', 'darkwheat')
call s:HL('jsxClosePunct', 'darkwheat')
call s:HL('jsxCloseString', 'darkwheat')
call s:HL('jsxBraces', 'magenta')

" TypeScript

call s:HL('typescriptVariable', 'magenta')
call s:HL('typescriptDestructureVariable', 'wheat')
call s:HL('typescriptBraces', 'wheat')
call s:HL('typescriptObjectLabel', 'wheat')
call s:HL('typescriptIdentifier', 'orange')
call s:HL('typescriptCacheMethod', 'green')
call s:HL('typescriptImport', 'magenta')
call s:HL('typescriptExport', 'magenta')
call s:HL('typescriptEndColons', 'wheat')

" jsDoc

call s:HL('jsDocTags', 'blue')

" HTML

call s:HL('htmlTagName', 'cyan')
call s:HL('htmlEndTag', 'darkwheat')
call s:HL('htmlTag', 'darkwheat')
call s:HL('htmlArg', 'green')

" XML

call s:HL('xmlTagName', 'cyan')
call s:HL('xmlTag', 'darkwheat')
call s:HL('xmlEqual', 'magenta')
call s:HL('xmlAttrib', 'green')


" Diff

call s:HL('DiffDelete', 'onyx', 'red')
call s:HL('DiffAdd', 'onyx', 'green')
call s:HL('DiffChange', 'onyx', 'teal')
call s:HL('DiffText', 'onyx', 'yellow')

call s:HL('diffRemoved', 'onyx', 'red')
call s:HL('diffAdded', 'onyx', 'green')
call s:HL('diffChanged', 'onyx', 'teal')
call s:HL('diffLine', 'onyx', 'blue')

" Python

call s:HL('pythonDottedName', 'cyan')
call s:HL('pythonClass', s:function_color)
call s:HL('pythonExClass', 'wheat')
call s:HL('pythonClassVar', 'orange')
call s:HL('pythonException', 'magenta')

" Django

call s:HL('djangoTagBlock', 'green')
call s:HL('djangoStatement', 'magenta')

" Rust

call s:HL('rustKeyword', 'magenta')
call s:HL('rustStorage', 'magenta')
call s:HL('rustEnumVariant', 'blue')
call s:HL('rustMacro', 'orange')
call s:HL('rustBoolean', 'blue')
call s:HL('rustModPath', 'yellow')

" " Haskell

" call s:HL('haskellType', 'shade4')
" call s:HL('haskellKeyword', 'shade3')
" call s:HL('haskellIdentifier', 'accent2')

" Erlang

call s:HL('erlangBracket', 'green')
call s:HL('erlangMacro', 'yellow')
call s:HL('erlangVariable', 'wheat')
call s:HL('erlangLocalFuncCall', 'wheat')
call s:HL('erlangGlobalFuncCall', 'wheat')
call s:HL('erlangBIF', 'blue')
call s:HL('erlangCommentAnnotation', 'blue')
call s:HL('erlangAtom', 'cyan')
call s:HL('erlangMap', 'magenta')
call s:HL('erlangRightArrow', 'cyan')
call s:HL('erlangDefine', 'yellow')

" CSS

call s:HL('cssPseudoClassId', 'cyan')
call s:HL('cssPseudoClassFn', 'cyan')
call s:HL('cssNoise', 'cyan')
call s:HL('cssBraces', 'wheat')
call s:HL('cssSelectorOp', 'magenta')
call s:HL('cssImportant', 'red')

" SCSS

call s:HL('scssSelectorName', 'wheat')
call s:HL('scssSemicolon', 'wheat')
call s:HL('scssSelectorChar', 'magenta')
call s:HL('scssAmpersand', 'magenta')
call s:HL('scssVariable', 'green')

" Vim wiki

call s:HL('VimwikiHeader1', 'orange')
call s:HL('VimwikiHeader2', 'teal')
call s:HL('VimwikiHeader3', 'teal')
call s:HL('VimwikiHeader4', 'teal')
call s:HL('VimwikiHeaderChar', 'teal')
call s:HL('VimwikiListTodo', 'teal')

" Markdown

call s:HL('markdownCodeBlock', 'magenta')

" FIXME
" ModeMsg
" MoreMsg
" NonText
" Question
" CursorColumn
" CursorLine
