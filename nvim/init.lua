require('config.options')
require('config.keybinds')
require('config.lazy')

vim.diagnostic.config({
    virtual_text = false,
    signs = false,
    underline = false,
})

vim.cmd.colorscheme("monokai-pro")
