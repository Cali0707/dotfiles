return {
	{ "nvim-lua/plenary.nvim" },
	{
		"folke/persistence.nvim",
		opts = { options = { "buffers", "curdir", "tabpages", "winsize", "help" } },
		keys = {
			{ "<leader>rs", function() require("persistence").load() end, desc = "Restore session" },
			{ "<leader>rl", function() require("persistence").load({ last = true }) end, desc = "Restore last session" },
			{ "<leader>rd", function() require("persistence").stop() end, desc = "Restore: don't save current session" },
		},
	},
}
