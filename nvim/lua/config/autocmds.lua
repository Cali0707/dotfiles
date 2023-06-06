local highlight_group = vim.api.nvim_create_augroup("YakHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})

vim.api.nvim_create_autocmd("FocusGained", { command = "checktime" })


