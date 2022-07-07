local telescope = require("telescope")
local actions = telescope.extensions.file_browser.actions

telescope.setup({
	extensions = {
		file_browser = {
			theme = "ivy",
			hijack_netrw = true,

			mappings = {
				n = {
					["r"] = actions.rename,
					["a"] = actions.create,
					["d"] = actions.remove,
					["<C-}>"] = actions.change_cwd,
				},
			},
		},
	},
})

telescope.load_extension("file_browser")

