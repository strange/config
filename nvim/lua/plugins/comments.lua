-- https://github.com/JoosepAlviste/nvim-ts-context-commentstring/wiki/Integrations#kommentary
--
-- Alternatives:
--
-- - Kommentary
-- - Comment.nvim
-- - mini.comment

vim.g.skip_ts_context_commentstring_module = true

return {
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    config = function()
      require("ts_context_commentstring").setup({
        enable_autocmd = true,
      })
    end,
  },
  {
    "terrortylor/nvim-comment",
    enabled = true,
    event = "BufReadPre",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    config = function()
      require("ts_context_commentstring").setup({
        enable_autocmd = false,
      })
      require("nvim_comment").setup({
        marker_padding = true,
        comment_empty = true,
        comment_empty_trim_whitespace = true,
        create_mappings = true,
        line_mapping = "gcc",
        operator_mapping = "gc",
        comment_chunk_text_object = "ic",
        hook = function()
          require("ts_context_commentstring").update_commentstring()
        end,
      })
    end,
  },
}
