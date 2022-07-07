local lspconfig = require("lspconfig")

local RUST_ANALYZER = {
	settings = {
		["rust-analyzer"] = {
			diagnostics = {
				enable = false,
			},
			checkOnSave = {
				enable = true,
				command = "clippy",
			},
		}
	},
}

lspconfig.rust_analyzer.setup(RUST_ANALYZER)

