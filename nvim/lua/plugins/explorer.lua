
return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        opts = {
            sources = {
                "filesystem",
                "buffers",
                "git_status",
            },

            source_selector = {
                winbar = true,
                statusline = false,
                show_scrolled_off_parent_node = true,
                sources = {
                    { source = "filesystem", display_name = " 󰉓 Files" },
                    { source = "buffers", display_name = " 󰈙 Buffers" },
                    { source = "git_status", display_name = " 󰊢 Git" },
                },
            },

            window = {
                position = "left",
                width = 32,
            },

            filesystem = {
                filtered_items = {
                    visible = true,
                    hidden_dotfiles = false,
                    hidden_gitignored = false,
                },

                follow_current_file = {
                    enabled = true,
                },
            },
        },

        keys = {
            {
                "<leader>e",
                "<cmd>Neotree toggle<CR>",
                desc = "Toggle Neo-tree",
            },
        },
    },

    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        opts = {
            options = {
                theme = "auto",
            },
        },
    },
}

