return {
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects"
		},
		build = ":TSUpdate",
		event = "BufReadPost",
		config = function()
			require("nvim-treesitter.configs").setup {
				ensure_installed = {
					"bash",
					"go",
					"gomod",
					"gosum",
					"html",
					"java",
					"javascript",
					"json",
					"lua",
					"markdown",
					"markdown_inline",
					"python",
					"query",
					"regex",
					"rust",
					"tsx",
					"typescript",
					"vim",
					"yaml",
				},
				highlight = { enable = true },
				indent = { enable = true, disable = { "python", "lua" } },
			}
		end,
	},
}
