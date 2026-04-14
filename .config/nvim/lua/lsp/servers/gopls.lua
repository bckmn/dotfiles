local common = require("lsp.common")

vim.lsp.config("gopls", {
	cmd = { "gopls" },
	filetypes = { "go", "gomod", "gowork", "gotmpl" },
	root_markers = { "go.work", "go.mod", ".git" },
	capabilities = common.get_capabilities(),
})

vim.lsp.enable("gopls")
