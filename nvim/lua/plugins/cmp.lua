local cmp = require'cmp'

cmp.setup({
  confirmation = { default_behaviour = cmp.ConfirmBehavior.Replace },
  sources = {
    { name = "buffer" },
    { name = "nvim_lsp" },
    { name = "nvim_lua" },
    { name = "path" },
  },
  mapping = {
    ["<CR>"] = cmp.mapping.confirm(),
    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
    ["<Tab>"] = cmp.mapping.select_next_item(),
  },
  formatting = {
    format = function(entry, item)
      item.kind = ({
        buffer = "[Buffer]",
        nvim_lsp = "[LSP]",
        nvim_lua = "[Nvim]",
        path = "[Path]",
      })[entry.source.name]
      return item
    end,
  },
})
