require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"lua",
		"go",
		"python",
		"tsx",
		"php",
		"html",
		"css",
		"javascript",
		"dart",
	},
	highlight = {
		enable = true,
		disable = { "html" },
	},
	indent = {
		enable = true,
		disable = { "html", "python" },
	},
	autotag = {
		enable = true,
	},
	context_commentstring = {
		enable = true,
	},
})

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
