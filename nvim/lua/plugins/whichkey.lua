return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    config = function()
      local wk = require("which-key")

      wk.setup({})

      local opts = {
        mode = "n",
        prefix = "<leader>",
        buffer = nil,
        silent = true,
        noremap = true,
        nowait = true,
      }

      wk.register({
        l = { "<cmd>Lazy<CR>", "Plugin Manager" },
        e = { "<cmd>Telescope find_files<cr>", "Files" },
        h = { "<cmd>Telescope oldfiles<cr>", "Recent files" },
        t = { "<cmd>Neotree<cr>", "Neotree" },
        f = {
          name = "Find ...",
          b = { "<cmd>Telescope buffers<cr>", "Buffers" },
          c = { "<cmd>Telescope commands<cr>", "Commands" },
          f = { "<cmd>Telescope find_files<cr>", "Files" },
          F = { "<cmd>Telescope find_files hidden=true<cr>", "Files (hidden)" },
          g = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
          G = { "<cmd>Telescope grep_string<cr>", "Grep String" },
          h = { "<cmd>Telescope help_tags<cr>", "Help" },
          i = { "<cmd>Telescope highlights<cr>", "Highlights" },
          j = { "<cmd>Telescope oldfiles<cr>", "Recent files" },
          p = { "<cmd>Telescope neoclip<cr>", "Clipboard" },
          k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
          l = { "<cmd>Telescope lsp_document_symbols<cr>", "LSP Symbols" },
          m = { "<cmd>Telescope marks<cr>", "Marks" },
          r = { "<cmd>Telescope resume<cr>", "Resume" },
          s = { "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>", "Current Buffer" },
        },
      }, opts)
    end
  }
}
