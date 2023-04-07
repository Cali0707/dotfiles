vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 12

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.termguicolors = true

vim.opt.splitright = true
vim.opt.updatetime = 50

vim.g.mapleader = " "
vim.cmd [[ colorscheme onedark ]]

vim.api.nvim_set_keymap('n', '<leader><CR>', ':so ~/.config/nvim/lua/user/init.lua', { noremap = true, silent = true })

vim.filetype.add({ extension = { ddl = 'sql' } })
