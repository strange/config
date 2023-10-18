syn region mkdWikiLink start="\[\[" end="]]" keepend contains=mkdWikiLinkStart,mkdWikiLinkEnd
syn match mkdWikiLinkStart /\[\[/ contained conceal
syn match mkdWikiLinkEnd /]]/ contained conceal

syn cluster mkdNonListItem contains=@htmlTop,htmlItalic,htmlBold,htmlBoldItalic,mkdFootnotes,mkdInlineURL,mkdLink,mkdLinkDef,mkdLineBreak,mkdBlockquote,mkdCode,mkdRule,htmlH1,htmlH2,htmlH3,htmlH4,htmlH5,htmlH6,mkdMath,mkdStrike,mkdWikiLink
