require('nvim-treesitter.configs').setup {
	-- Which grammars should be installed
	ensure_installed = {
		"bash",
		"c",
		"cmake",
		"comment",
		"cpp",
		"dart",
		"dockerfile",
		"go",
		"gomod",
		"html",
		"http",
		"javascript",
		"jsdoc",
		"json",
		"latex",
		"llvm",
		"lua",
		"markdown",
		"python",
		"regex",
		"rust",
		"scss",
		"sql",
		"tsx",
		"typescript",
		"verilog",
		"yaml"
	},

	-- Install asynchronously
	sync_install = false,

	-- Automatically install any missing parser when needed
	auto_install = true,

    indent = {
        enable = true,
        disable = { "go", "python" }
    },
	-- options about highlighting
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
}
