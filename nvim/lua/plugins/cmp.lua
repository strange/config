local cmp = require'cmp'

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  confirmation = { default_behaviour = cmp.ConfirmBehavior.Replace },
  sources = {
    { name = "vsnip" },
    {
      name = "buffer",
      opts = {
        get_bufnrs = function()
          local bufs = {}
          for _, win in ipairs(vim.api.nvim_list_wins()) do
            bufs[vim.api.nvim_win_get_buf(win)] = true
          end
          return vim.tbl_keys(bufs)
        end
      }
    },
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
