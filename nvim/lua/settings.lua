local tabsize = 4

-- General

vim.g.mapleader = ','
vim.o.mouse = 'a'

-- UI

vim.o.termguicolors = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.fillchars = "stl:-,vert:|,fold:-,diff:-"
vim.o.scrolloff = 1
vim.o.lazyredraw = true

-- Gutter

vim.o.number = true
vim.o.signcolumn = 'number'

-- Statusline

vim.o.statusline = " %f%m%r %= Ln %l, Col %v (%p%%) "

-- Indentation and formatting

vim.o.formatoptions = vim.o.formatoptions:gsub("t", "") -- Do not textwrap

vim.o.smartcase = true
vim.o.smarttab = true
vim.o.smartindent = true
vim.o.expandtab = true
vim.o.shiftwidth = tabsize
vim.o.tabstop = tabsize
vim.o.softtabstop = tabsize
vim.o.tw = 78
vim.o.colorcolumn = '+2'
vim.o.wrap = false
vim.o.joinspaces = false

-- History, backup, clipboard and undo

vim.o.history = 1000
vim.o.undolevels = 1000
vim.o.undofile = true
vim.o.clipboard = "unnamed"
