local tabsize = 4

-- General

vim.g.mapleader = ","
vim.opt.mouse = "a"
vim.opt.updatetime = 500
vim.opt.hidden = false

-- UI

vim.opt.termguicolors = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.fillchars = "stl:-,vert:|,fold:-,diff:-"
vim.opt.scrolloff = 1
vim.opt.lazyredraw = true
vim.opt.sidescroll = 0
vim.opt.foldenable = false
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.shortmess:append("acsI")

-- Gutter

vim.opt.number = true
vim.opt.signcolumn = "number"

-- Statusline

vim.opt.statusline = " %f%m%r %= Ln %l, Col %v (%p%%) "

-- Indentation and formatting

vim.opt.formatoptions:remove("t") -- Do not textwrap
vim.opt.formatexpr = ""
vim.opt.briopt:append("list:-1")

vim.opt.smartcase = true
vim.opt.smarttab = true
vim.opt.smartindent = false
vim.opt.expandtab = true
vim.opt.shiftwidth = tabsize
vim.opt.tabstop = tabsize
vim.opt.softtabstop = tabsize
vim.opt.tw = 78
vim.opt.colorcolumn = "+2"
vim.opt.wrap = false
vim.opt.joinspaces = false

-- History, backup, clipboard and undo

vim.opt.history = 1000
vim.opt.undolevels = 1000
vim.opt.undofile = true
vim.opt.clipboard = "unnamed"
