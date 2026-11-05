require('config.options')
require('config.keybinds')
require('config.lazy')

vim.diagnostic.config({
    virtual_text = {
        source = "always",
        prefix = " > ",
    },
})

vim.cmd.colorscheme("onedark")

-- Custom Dracula: fundo mais escuro
-- vim.api.nvim_set_hl(0, 'Normal', { bg = '#21222C', fg = '#F8F8F2' })
-- vim.api.nvim_set_hl(0, 'Normal', { bg = '#1A1A24', fg = '#F8F8F2' })
-- vim.api.nvim_set_hl(0, 'Normal', { bg = '#191A21', fg = '#F8F8F2' })
