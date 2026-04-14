local common = require("lsp.common")

vim.lsp.config("cssls", {
	cmd = { "vscode-css-language-server", "--stdio" },
	filetypes = { "css", "scss", "less" },
	root_markers = { "package.json", ".git" },
	capabilities = common.get_capabilities(),
})

vim.lsp.enable("cssls")
