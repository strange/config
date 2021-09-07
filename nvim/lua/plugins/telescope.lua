local actions = require('telescope.actions')

require('telescope').setup {
    defaults = {
        mappings = {
            i = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
            },
        },
    },
}

vim.cmd([[nnoremap <leader>e <cmd>Telescope find_files<cr>]])
vim.cmd([[nnoremap <leader>h <cmd>Telescope oldfiles<cr>]])
vim.cmd([[nnoremap <leader>f <cmd>Telescope live_grep<cr>]])
