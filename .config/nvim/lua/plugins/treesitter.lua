return { -- Highlight, edit, and navigate code
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter").install({
			"bash",
			"c",
			"css",
			"diff",
			"html",
			"javascript",
			"json",
			"lua",
			"luadoc",
			"markdown",
			"markdown_inline",
			"python",
			"query",
			"sql",
			"typescript",
			"tsx",
			"vim",
			"vimdoc",
		})

		-- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
		local regex_highlight = { ruby = true }
		local indent_disabled = { ruby = true }

		vim.api.nvim_create_autocmd("FileType", {
			group = vim.api.nvim_create_augroup("user-treesitter", { clear = true }),
			callback = function(args)
				local bufnr = args.buf
				local ft = args.match
				if not pcall(vim.treesitter.start, bufnr) then
					return
				end
				if regex_highlight[ft] then
					vim.bo[bufnr].syntax = "ON"
				end
				if not indent_disabled[ft] then
					vim.bo[bufnr].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				end
			end,
		})
	end,
}
