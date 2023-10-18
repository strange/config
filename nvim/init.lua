require("config/options")
require("config/keymaps")
require("config/au")
require("config/plugins")

--   use({ "numToStr/FTerm.nvim" })
--   require("FTerm").setup({
--     border = "single",
--     dimensions = {
--       height = 0.9,
--       width = 0.9,
--     },
--   })
--
--   -- Misc
--   use({
--     "echasnovski/mini.nvim",
--     config = "require('mini.splitjoin').setup()",
--   })
--
--   -- Language support
--   use("neoclide/vim-jsx-improve")
--   use("Vimjas/vim-python-pep8-indent")
--   use("SidOfc/mkdx")
--   use({
--     "iamcco/markdown-preview.nvim",
--     run = "cd app && npm install",
--     setup = function()
--       vim.g.mkdp_filetypes = { "markdown" }
--     end,
--     ft = { "markdown" },
--   })
--
--   -- LSP and completion
--   use({ "mickael-menu/zk-nvim", config = "require('plugins.zk')" })
--   use({ "jose-elias-alvarez/null-ls.nvim", config = "require('plugins.null')" })
--
--   use({
--     "folke/trouble.nvim",
--     cmd = {
--       "Trouble",
--       "TroubleToggle",
--     },
--     config = function()
--       require("trouble").setup({
--         icons = false,
--       })
--     end,
--   })
