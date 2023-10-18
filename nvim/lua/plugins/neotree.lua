-- https://github.com/nvim-neo-tree/neo-tree.nvim/blob/v1.x/lua/neo-tree/defaults.lua

require("neo-tree").setup({
  enable_git_status = false,
  enable_diagnostics = false,
  use_popups_for_input = false,
  default_component_configs = {
    indent = {
      with_markers = false,
      padding = 0,
      indent_size = 1,
    },
    icon = {
      folder_closed = "+",
      -- folder_closed = "🡺",
      -- folder_closed = "›",
      -- folder_closed = "▸",
      -- folder_closed = "▶",
      folder_open = "-",
      -- folder_open = "🡻",
      -- folder_open = "▼",
      -- folder_empty = "Ø",
      folder_empty = "×",
      -- folder_empty = "▷",
      default = " ",
    },
    name = {
      trailing_slash = false,
      use_git_status_colors = true,
    },
  },
  filesystem = {
    filtered_items = {
      hide_dotfiles = false,
      hide_gitignore = true,
    },
    use_libuv_file_watcher = true,
    hijack_netrw_behavior = "open_current",
    window = {
      mappings = {
        ["<2-LeftMouse>"] = "open",
        ["<cr>"] = "open",
        ["S"] = "open_split",
        ["s"] = "open_vsplit",
        ["C"] = "close_node",
        ["-"] = "navigate_up",
        ["."] = "set_root",
        ["H"] = "toggle_hidden",
        ["I"] = "toggle_gitignore",
        ["R"] = "refresh",
        ["/"] = "fuzzy_finder",
        ["f"] = "filter_on_submit",
        ["<c-x>"] = "clear_filter",
        ["a"] = "add",
        ["d"] = "delete",
        ["r"] = "rename",
        ["c"] = "copy_to_clipboard",
        ["x"] = "cut_to_clipboard",
        ["p"] = "paste_from_clipboard",
        ["m"] = "move",
        ["q"] = "close_window",
      },
    },
  },
})

vim.cmd([[
  nnoremap <leader>t :Neotree reveal toggle<cr>
  noremap - :Neotree reveal current<cr>
]])

vim.cmd([[
  hi link NeoTreeDirectoryName Directory
  hi link NeoTreeDirectoryIcon NeoTreeDirectoryName
]])
