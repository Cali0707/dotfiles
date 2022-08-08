local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	is_bootstrap = true
	vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
	vim.cmd [[packadd packer.nvim]]
end

local status_ok, packer = pcall(require, "packer")
if not status_ok then
	print("Unable to load packer")
	return
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer.lua source <afile> | PackerSync
  augroup end
]])

-- Use a popup window for packer
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

return packer.startup(function(use)
	use 'wbthomason/packer.nvim'

	use("nvim-treesitter/nvim-treesitter", {
		run = ":TSUpdate"
	})

	use("neovim/nvim-lspconfig")

	use("williamboman/mason.nvim")

	use("williamboman/mason-lspconfig.nvim")

	use("navarasu/onedark.nvim")

	-- Automatically set up config after cloning packer.nvim
	if is_bootstrap then
		require("packer").sync()
	end
end)
