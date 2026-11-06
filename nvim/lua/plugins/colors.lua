return {
    {
        "navarasu/onedark.nvim",
          priority = 1000, -- make sure to load this before all the other start plugins
          config = function()
            require('onedark').setup {
              style = 'deep',
              -- colors = { bg0 = '#1d1d1d'},
            }
                require('onedark').load()
        end
    },

    {
        "loctvl842/monokai-pro.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("monokai-pro").setup({
                filter = "spectrum",
                transparent_background = false,
                terminal_colors = true,
            })
        end,
    },

    {
        "folke/tokyonight.nvim",
         lazy = false,
         priority = 1000,
         opts = {},
    },

    {
        "rebelot/kanagawa.nvim",
        lazy = false,
        priority = 1000,
    },

    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = false,
        priority = 1000,
    },

    {
        'projekt0n/github-nvim-theme',
        name = 'github-theme',
        lazy = false,
        priority = 1000,
    },

    {
        "dracula/vim",
        name = "dracula",
        lazy = false,
        priority = 1000,
    },

    -- Lualine Configs (status bar)
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            theme = 'auto',
            lualine_x = {'diagnostics'}
        }
    },
}
