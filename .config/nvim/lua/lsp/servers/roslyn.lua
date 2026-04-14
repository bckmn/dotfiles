vim.filetype.add({
	extension = {
		razor = "razor",
		cshtml = "razor",
	},
})

local common = require("lsp.common")

local cmd = {
	"roslyn",
	"--stdio",
	"--logLevel=Information",
	"--extensionLogDirectory=" .. vim.fs.dirname(vim.lsp.get_log_path()),
}

vim.lsp.config("roslyn", {
	cmd = cmd,
	filetypes = { "cs", "razor" },
	root_markers = { "*.sln", "*.csproj", ".git" },
	handlers = require("rzls.roslyn_handlers"),
	capabilities = vim.tbl_deep_extend("force", common.get_capabilities(), {
		textDocument = {
			formatting = { dynamicRegistration = true },
		},
	}),
	settings = {
		["csharp|inlay_hints"] = {
			csharp_enable_inlay_hints_for_implicit_object_creation = true,
			csharp_enable_inlay_hints_for_implicit_variable_types = true,
			csharp_enable_inlay_hints_for_lambda_parameter_types = true,
			csharp_enable_inlay_hints_for_types = true,
			dotnet_enable_inlay_hints_for_indexer_parameters = true,
			dotnet_enable_inlay_hints_for_literal_parameters = true,
			dotnet_enable_inlay_hints_for_object_creation_parameters = true,
			dotnet_enable_inlay_hints_for_other_parameters = true,
			dotnet_enable_inlay_hints_for_parameters = true,
			dotnet_suppress_inlay_hints_for_parameters_that_differ_only_by_suffix = true,
			dotnet_suppress_inlay_hints_for_parameters_that_match_argument_name = true,
			dotnet_suppress_inlay_hints_for_parameters_that_match_method_intent = true,
		},
		["csharp|code_lens"] = {
			dotnet_enable_references_code_lens = true,
		},
	},
})

vim.lsp.enable("roslyn")
