-- Load common configuration and set up autocmds
local common = require("lsp.common")
common.setup_attach_keymaps()

-- LSP formatting on save
vim.api.nvim_create_autocmd("BufWritePre", {
	group = vim.api.nvim_create_augroup("lsp-format-on-save", { clear = true }),
	callback = function(args)
		local bufnr = args.buf
		local ft = vim.bo[bufnr].filetype

		-- Disable formatting for certain filetypes
		local disable_filetypes = { c = true, cpp = true }
		if disable_filetypes[ft] then
			return
		end

		-- Use LSP formatting
		vim.lsp.buf.format({
			timeout_ms = 500,
			bufnr = bufnr,
		})
	end,
})

-- Manual format keymap
vim.keymap.set("n", "<leader>f", function()
	vim.lsp.buf.format({ async = true })
end, { desc = "[F]ormat buffer" })

-- Load all server configurations
require("lsp.servers.cssls")
require("lsp.servers.ts_ls")
require("lsp.servers.gopls")
require("lsp.servers.html")
require("lsp.servers.lua_ls")
require("lsp.servers.roslyn")
require("lsp.servers.gleam")
