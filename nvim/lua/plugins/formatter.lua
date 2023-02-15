local formatter = require("formatter")

vim.api.nvim_exec(
	[[
    augroup FormatAutogroup
      autocmd!
      autocmd BufWritePost *.jsx,*.ts,*.tsx,*.js,*.rs,*.lua,*.py,*.md,*.json,*.jsonc FormatWrite
    augroup END
  ]],
	true
)

formatter.setup({
	filetype = {
		lua = {
			function()
				return {
					exe = "stylua",
					args = {
						"-",
					},
					stdin = true,
				}
			end,
		},
	},
})

formatter.setup({
	filetype = {
		python = {
			function()
				return {
					exe = "black",
					args = { "-" },
					stdin = true,
				}
			end,
		},
	},
})

formatter.setup({
	filetype = {
		rust = {
			-- Rustfmt
			function()
				return {
					exe = "rustfmt",
					args = { "--emit=stdout" },
					stdin = true,
				}
			end,
		},
	},
})

function denofmt()
	return {
		exe = "deno fmt",
		args = {
			"--options-single-quote",
			"--options-line-width=100",
			"-",
		},
		stdin = true,
	}
end

-- formatter.setup({
-- 	filetype = {
-- 		javascript = { denofmt },
-- 		javascriptreact = { denofmt },
-- 		typescript = { denofmt },
-- 		typescriptreact = { denofmt },
-- 		markdown = { denofmt },
-- 		json = { denofmt },
-- 		jsonc = { denofmt },
-- 	},
-- })

formatter.setup({
	filetype = {
		json = { denofmt },
	},
})

-- formatter.setup({
-- 	filetype = {
-- 		json = { denofmt },
-- 	},
-- })

-- formatter.setup({
-- 	filetype = {
-- 		json = { denofmt },
-- 	},
-- })

-- formatter.setup({
-- 	filetype = {
-- 		sh = {
-- 			function()
-- 				return {
-- 					exe = "shfmt",
-- 					args = { "-i", 2 },
-- 					stdin = true,
-- 				}
-- 			end,
-- 		},
-- 	},
-- })
