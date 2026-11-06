require('config.options')
require('config.keybinds')
require('config.lazy')

vim.diagnostic.config({
    virtual_text = {
        source = "always",
        prefix = " > ",
    },
})

vim.cmd.colorscheme("monokai-pro")
