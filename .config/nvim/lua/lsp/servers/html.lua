local common = require("lsp.common")

vim.lsp.config("html", {
	cmd = { "vscode-html-language-server", "--stdio" },
	filetypes = { "html", "razor", "cshtml" },
	root_markers = { "package.json", ".git" },
	capabilities = common.get_capabilities(),
})

vim.lsp.enable("html")
