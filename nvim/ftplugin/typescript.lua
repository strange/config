local gen_hook = MiniSplitjoin.gen_hook
local comma_brackets = { brackets = { "%b{}", "%b()", "%b[]" } }
local pad_brackets = { brackets = { "%b{}" } }

local add_comma = gen_hook.add_trailing_separator(comma_brackets)
local del_comma = gen_hook.del_trailing_separator(comma_brackets)
local pad = gen_hook.pad_brackets(pad_brackets)

vim.b.minisplitjoin_config = {
  split = { hooks_post = { add_comma } },
  join = { hooks_post = { del_comma, pad } },
}
