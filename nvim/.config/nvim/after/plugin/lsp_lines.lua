local lsp_lines = require('lsp_lines')
lsp_lines.setup()

local function toggle_diagnostics()
    local diagnostics_on = lsp_lines.toggle()
    if diagnostics_on then
        vim.diagnostic.config({
            virtual_text = false
        })
    else
        vim.diagnostic.config({
            virtual_text = { spacing = 4, prefix = '●' }
        })
    end
end

vim.keymap.set('n', '<leader>tdt', toggle_diagnostics, { desc = '[T]oggle [d]iagostic [t]ype' })
