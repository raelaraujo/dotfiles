vim.opt.tabstop = 4           -- Tabulation with 4 spaces
vim.opt.shiftwidth = 4        -- Indentation with 4 spaces
vim.opt.expandtab = true      -- Replace TAB with spaces
vim.opt.autoindent = true     -- Enable automatic indentation
vim.opt.smarttab = true       -- Smart indentation
vim.opt.smartindent = true    -- Smart indentation
vim.opt.colorcolumn = "88"    -- Highlight column 88
vim.opt.termguicolors = true  -- True color 
vim.g.vimtex_view_method = "zathura"
vim.g.vimtex_compiler_method = "latexmk"

vim.opt.number = true         -- Show line numbers 
-- vim.opt.relativenumber = true -- Show relative line numbers
vim.opt.scrolloff = 10         -- Minimum number of lines to keep above and below the cursor
vim.opt.cursorline = true     -- Highlight the current line
vim.opt.signcolumn = "yes"    -- Always show the sign column
vim.opt.mouse = 'a'           -- Enable mouse support
vim.opt.undofile = true       -- Persistent undo history

vim.opt.clipboard = 'unnamedplus' -- Enable system clipboard

vim.api.nvim_create_user_command("W", "w", {})
vim.api.nvim_create_user_command("Wa", "wa", {})
vim.api.nvim_create_user_command("WA", "wa", {})
vim.api.nvim_create_user_command("WQA", "wqa", {})
vim.api.nvim_create_user_command("WQa", "wqa", {})
vim.api.nvim_create_user_command("Wqa", "wqa", {})

vim.api.nvim_create_user_command("Q", "q", {})
vim.api.nvim_create_user_command("X", "x", {})
vim.api.nvim_create_user_command("Qa", "qa", {})

vim.cmd([[ set guicursor= ]])
