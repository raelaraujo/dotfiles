return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "master",
        build = ":TSUpdate",

        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
            "windwp/nvim-ts-autotag",
        },

        config = function()
            require("nvim-treesitter.configs").setup({

                -- Parsers
                ensure_installed = {
                    "json",
                    "python",
                    "javascript",
                    "typescript",
                    "tsx",
                    "query",
                    "php",
                    "yaml",
                    "html",
                    "css",
                    "scss",
                    "markdown",
                    "markdown_inline",
                    "bash",
                    "lua",
                    "vim",
                    "vimdoc",
                    "c",
                    "dockerfile",
                    "gitignore",
                    "astro",
                    "sql",
                    "toml",
                    "xml",
                    "regex",
                    "gitcommit",
                    "diff",
                },

                auto_install = false,

                highlight = {
                    enable = true,
                },

                indent = {
                    enable = true,
                },

                -- Text Objects
                textobjects = {
                    select = {
                        enable = true,
                        lookahead = true,

                        keymaps = {
                            ["af"] = "@function.outer",
                            ["if"] = "@function.inner",
                        },
                    },
                },
            })

            -- Auto close HTML/JSX tags
            require("nvim-ts-autotag").setup()
        end,
    },
}

