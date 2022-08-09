local nmap = function(keys, func, desc)
    if desc then
        desc = 'Nvim Tree: ' .. desc
    end
    vim.keymap.set('n', keys, func, { desc = desc })
end

require("nvim-tree").setup({
    sort_by = "case_insensitive",
    view = {
        adaptive_size = true,
        mappings = {
            list = {
                { key = "u", action = "dir_up" },
            },
        },
    }
})

nmap("<leader>tt", ":NvimTreeToggle<CR>", "[T]oggle [T]ree")
