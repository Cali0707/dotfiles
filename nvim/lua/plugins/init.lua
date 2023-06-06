return {
	"nvim-lua/plenary.nvim",
	{
		"nvim-tree/nvim-web-devicons",
		config = { default = true },
	},
	{
		"stevearc/dressing.nvim",
		event = "VeryLazy",
		config = true,
	},
	{
		"rcarriga/nvim-notify",
		event = "VeryLazy",
		enabled = true,
		config = { default = true },
	},
	{
		"sindrets/diffview.nvim",
		cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
		config = true,
	},
	{
		"m4xshen/autoclose.nvim",
		event = "InsertEnter",
	},
}
