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
    -- local packages
    use "~/Personal/projects/nuggit.nvim"
    -- remote packages

    use 'wbthomason/packer.nvim'

    use("nvim-treesitter/nvim-treesitter", {
        run = ":TSUpdate"
    })

    use("neovim/nvim-lspconfig")

    use("williamboman/mason.nvim")

    use("williamboman/mason-lspconfig.nvim")

    -- use({ 'monsonjeremy/onedark.nvim', branch = 'treesitter' })

    use { 'olimorris/onedarkpro.nvim' }

    use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } }

    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable "make" == 1 }

    use { 'hrsh7th/nvim-cmp', requires = { 'hrsh7th/cmp-nvim-lsp' } }

    use { 'L3MON4D3/LuaSnip', requires = { 'saadparwaiz1/cmp_luasnip' } }

    use { 'jamestthompson3/nvim-remote-containers' }

    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons', -- optional, for file icons
        },
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }

    use {
        'ThePrimeagen/harpoon',
        requires = {
            'nvim-lua/plenary.nvim'
        }
    }

    use {
        'https://git.sr.ht/~whynothugo/lsp_lines.nvim'
    }

    use {
        'akinsho/toggleterm.nvim',
        tag = '*'
    }

    -- Automatically set up config after cloning packer.nvim
    if is_bootstrap then
        require("packer").sync()
    end
end)
