local common = require("lsp.common")

vim.lsp.config("ts_ls", {
	cmd = { "typescript-language-server", "--stdio" },
	filetypes = { "javascript", "typescript", "typescriptreact", "javascriptreact", "mdx" },
	root_markers = { "package.json", "tsconfig.json", "jsconfig.json", ".git" },
	capabilities = common.get_capabilities(),
})

vim.lsp.enable("ts_ls")
