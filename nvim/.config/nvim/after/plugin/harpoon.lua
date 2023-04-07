require('harpoon').setup({})
require('telescope').load_extension('harpoon')

local ui = require('harpoon.ui')

vim.keymap.set('n', '<leader>ha', require('harpoon.mark').add_file, { noremap = true, desc = '[H]arpoon [a]dd' })
vim.keymap.set('n', '<leader>hm', ui.toggle_quick_menu, { noremap = true, desc = '[H]arpoon [m]enu' })
vim.keymap.set('n', '<leader>hn', ui.nav_next, { noremap = true, desc = '[H]arpoon [n]ext' })
vim.keymap.set('n', '<leader>hp', ui.nav_prev, { noremap = true, desc = '[H]arpoon [p]rev' })
vim.keymap.set('n', '<leader>h1', function ()
   ui.nav_file(1)
end, { noremap = true, desc = '[H]arpoon [1]st file' })
vim.keymap.set('n', '<leader>h2', function ()
   ui.nav_file(2)
end, { noremap = true, desc = '[H]arpoon [2]nd file' })
vim.keymap.set('n', '<leader>h3', function ()
   ui.nav_file(3)
end, { noremap = true, desc = '[H]arpoon [3]nd file' })
vim.keymap.set('n', '<leader>h4', function ()
   ui.nav_file(4)
end, { noremap = true, desc = '[H]arpoon [4]th file' })
