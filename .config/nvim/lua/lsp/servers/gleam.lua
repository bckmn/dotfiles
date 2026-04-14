local common = require("lsp.common")

vim.lsp.config("gleam", {
	cmd = { "gleam", "lsp" },
	filetypes = { "gleam" },
	root_markers = { "gleam.toml", ".git" },
	capabilities = common.get_capabilities(),
})

vim.lsp.enable("gleam")
