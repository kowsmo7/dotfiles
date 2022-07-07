local treesitter = require("nvim-treesitter.configs")

treesitter.setup({
	ensure_installed = { "lua", "rust", "vim" },
	sync_install = true,

	highlight = {
		enable = true,
		additional_vim_regex_highlighting = { "lua" },
	},
})
