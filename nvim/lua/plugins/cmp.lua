-- local cmp = require("cmp")

-- cmp.setup({
-- 	snippet = {
-- 		expand = function(args)
-- 			vim.fn["vsnip#anonymous"](args.body)
-- 		end,
-- 	},
--   -- Insert or Replace
-- 	confirmation = { default_behaviour = cmp.ConfirmBehavior.Insert },
-- 	sources = {
-- 		{ name = "vsnip" },
-- 		{
-- 			name = "buffer",
-- 			option = {
-- 				get_bufnrs = function()
-- 					local bufs = {}
-- 					for _, win in ipairs(vim.api.nvim_list_wins()) do
-- 						bufs[vim.api.nvim_win_get_buf(win)] = true
-- 					end
-- 					return vim.tbl_keys(bufs)
-- 				end,
-- 			},
-- 		},
-- 		{ name = "nvim_lsp" },
-- 		{ name = "nvim_lua" },
-- 		{ name = "path" },
-- 	},
-- 	mapping = {
-- 		["<CR>"] = cmp.mapping.confirm(),
-- 		["<S-Tab>"] = cmp.mapping.select_prev_item(),
-- 		["<Tab>"] = cmp.mapping.select_next_item(),
-- 	},
-- 	formatting = {
-- 		format = function(entry, item)
-- 			item.kind = ({
-- 				buffer = "[Buffer]",
-- 				nvim_lsp = "[LSP]",
-- 				nvim_lua = "[Nvim]",
-- 				path = "[Path]",
-- 			})[entry.source.name]
-- 			return item
-- 		end,
-- 	},
-- })

local cmp = require'cmp'

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
		["<S-Tab>"] = cmp.mapping.select_prev_item(),
		["<Tab>"] = cmp.mapping.select_next_item(),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = false }),
    -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources(
    {
      { name = 'nvim_lsp' },
      { name = 'nvim_lua' },
      { name = 'vsnip' },
    },
    {
      { name = 'buffer', keyword_length = 2 },
    })
})

-- Set configuration for specific filetype.
-- cmp.setup.filetype('gitcommit', {
--   sources = cmp.config.sources({
--     { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
--   }, {
--     { name = 'buffer' },
--   })
-- })

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  },
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources(
    {
      { name = 'path' }
    },
    {
      { name = 'cmdline' }
    })
})

-- Set up lspconfig.
-- local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
require('lspconfig')['tsserver'].setup {
}
