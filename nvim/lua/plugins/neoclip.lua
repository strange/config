local actions = require('telescope.actions')

require('neoclip').setup({
    history = 1000,
    preview = true,
    enable_persistant_history = true,
    keys = {
        i = {
            paste_behind = '<c-b>',
        },
    },
})

vim.cmd([[noremap <leader>p <cmd>lua require('telescope').extensions.neoclip.default()<cr>]])
