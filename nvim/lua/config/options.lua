local tabsize = 4

-- General

vim.g.mapleader = ","
vim.o.mouse = "a"
vim.o.updatetime = 500
vim.o.hidden = false

-- UI

vim.o.termguicolors = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.fillchars = "stl:-,vert:|,fold:-,diff:-"
vim.o.scrolloff = 1
vim.o.lazyredraw = true
vim.o.sidescroll = 0
vim.o.foldenable = false
vim.o.completeopt = "menu,menuone,noselect"

-- Gutter

vim.o.number = true
vim.o.signcolumn = "number"

-- Statusline

-- vim.o.statusline = " %f%m%r %= Ln %l, Col %v (%p%%) "

function lsp_diagnostics()
  local targets = { "Error", "Warning", "Information", "Hint" }
  local output = {}

  for _, target in pairs(targets) do
    local count = vim.lsp.diagnostic.get_count(0, [[Warning]])
    if count > 0 then
      table.insert(output, string.format("%s:%s", string.sub(target, 1, 1), count))
    end
  end

  if #output > 0 then
    return "[" .. table.concat(output, ",") .. "]"
  end

  return ""
end

vim.o.statusline = " %f%m%r %= Ln %l, Col %v (%p%%) "
-- vim.o.statusline = " %f%m%r %= Ln %l, Col %v (%p%%) %{luaeval('lsp_diagnostics()')} "

-- Indentation and formatting

vim.o.formatoptions = vim.o.formatoptions:gsub("t", "") -- Do not textwrap
vim.o.formatexpr = ""

vim.o.smartcase = true
vim.o.smarttab = true
vim.o.smartindent = false
vim.o.expandtab = true
vim.o.shiftwidth = tabsize
vim.o.tabstop = tabsize
vim.o.softtabstop = tabsize
vim.o.tw = 78
vim.o.colorcolumn = "+2"
vim.o.wrap = false
vim.o.joinspaces = false

-- History, backup, clipboard and undo

vim.o.history = 1000
vim.o.undolevels = 1000
vim.o.undofile = true
vim.o.clipboard = "unnamed"
