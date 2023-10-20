-- https://github.com/JoosepAlviste/nvim-ts-context-commentstring/wiki/Integrations#kommentary
--
-- Alternatives:
--
-- - Kommentary
-- - Comment.nvim
-- - mini.comment

return {
	"terrortylor/nvim-comment",
	event = "BufReadPre",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
		"JoosepAlviste/nvim-ts-context-commentstring",
	},
	config = function()
		require("nvim_comment").setup({
			marker_padding = true,
			comment_empty = true,
			comment_empty_trim_whitespace = true,
			create_mappings = true,
			line_mapping = "gcc",
			operator_mapping = "gc",
			comment_chunk_text_object = "ic",
			hook = function()
				require("ts_context_commentstring.internal").update_commentstring()
			end,
		})
	end,
}
