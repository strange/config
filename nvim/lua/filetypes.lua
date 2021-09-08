vim.cmd [[
  au BufEnter *.conf set filetype=conf
]]

vim.cmd [[
  autocmd FileType text,markdown,xml,html,xhtml,erlang setlocal sw=4 ts=4
]]

vim.cmd [[
  autocmd FileType lua,javascript setlocal sw=2 ts=2
]]

vim.cmd [[
  autocmd FileType toml setlocal comments=:# commentstring=#\ %s
]]
