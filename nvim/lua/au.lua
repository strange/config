vim.cmd([[
  au BufEnter *.conf set filetype=conf
]])

-- vim.cmd([[
--   autocmd BufEnter * :syntax sync maxlines=600
-- ]])

vim.cmd([[
  autocmd FileType text,markdown,xml,html,xhtml,erlang setlocal sw=4 ts=4
]])

vim.cmd([[
  autocmd FileType lua,javascript setlocal sw=2 ts=2
]])

vim.cmd([[
  autocmd FileType markdown set conceallevel=2
]])

vim.cmd([[
  autocmd FileType toml setlocal comments=:# commentstring=#\ %s
]])

-- vim.cmd([[
--   augroup fmt
--     autocmd!
--     au BufWritePre * try | undojoin | Neoformat | catch /^Vim\%((\a\+)\)\=:E790/ | finally | silent Neoformat | endtry
--   augroup END
-- ]])
