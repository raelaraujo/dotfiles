return {
    -- LSP Configuration
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            local keymap = vim.keymap
            local capabilities =
                require("cmp_nvim_lsp").default_capabilities()

            -- LSP Keymaps
            keymap.set("n", "K", vim.lsp.buf.hover, {})
            keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
            keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
            keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})

            keymap.set("n", "<leader>gf", function()
                vim.lsp.buf.format({
                    timeout_ms = 5000,
                })
            end, {})

            -- LSP Capabilities (aplica a todos os servers)
            vim.lsp.config("*", {
                capabilities = capabilities,
            })

            local servers = {
                "lua_ls",
                "pyright",
                "clangd",
                "jsonls",
                "bashls",
                "yamlls",
                "texlab",
            }

            -- Garante que os servers sejam habilitados (Neovim 0.11+)
            vim.lsp.enable(servers)
        end,
    },

    -- Mason
    {
        "mason-org/mason.nvim",
        opts = {
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        },
    },

    -- Mason LSP Config
    {
        "mason-org/mason-lspconfig.nvim",
        dependencies = {
            "mason-org/mason.nvim",
            "neovim/nvim-lspconfig",
        },
        opts = {
            ensure_installed = {
                "lua_ls",
                "pyright",
                "clangd",
                "jsonls",
                "bashls",
                "yamlls",
                "texlab",
            },
        },
    },

    -- Autocomplete
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "saadparwaiz1/cmp_luasnip",
            "L3MON4D3/LuaSnip",
        },
        config = function()
            local cmp = require("cmp")

            cmp.setup({
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },

                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },

                mapping = cmp.mapping.preset.insert({
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm({
                        select = true,
                    }),
                }),

                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                }, {
                    { name = "buffer" },
                }),
            })
        end,
    },

    -- LSP Completion Source
    {
        "hrsh7th/cmp-nvim-lsp",
    },

    -- Buffer Completion Source
    {
        "hrsh7th/cmp-buffer",
    },

    -- LuaSnip
    {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        build = "make install_jsregexp",
        config = function()
            local ls = require("luasnip")

            local function jump_or_tab(forward)
                return function()
                    if forward then
                        if ls.expand_or_jumpable() then
                            ls.jump(1)
                        else
                            return vim.api.nvim_replace_termcodes(
                                "<Tab>",
                                true,
                                true,
                                true
                            )
                        end
                    else
                        if ls.jumpable(-1) then
                            ls.jump(-1)
                        else
                            return vim.api.nvim_replace_termcodes(
                                "<C-d>",
                                true,
                                true,
                                true
                            )
                        end
                    end
                end
            end

            vim.keymap.set({ "i", "s" }, "<Tab>", function()
                local termcode = jump_or_tab(true)()

                if termcode then
                    vim.api.nvim_feedkeys(termcode, "n", true)
                end
            end, { silent = true })

            vim.keymap.set({ "i", "s" }, "<S-Tab>", function()
                local termcode = jump_or_tab(false)()

                if termcode then
                    vim.api.nvim_feedkeys(termcode, "n", true)
                end
            end, { silent = true })
        end,
    },

    -- LuaSnip Completion Source
    {
        "saadparwaiz1/cmp_luasnip",
    },

    -- LSP Signature
    {
        "ray-x/lsp_signature.nvim",
        event = "InsertEnter",
        opts = {
            bind = true,
            handler_opts = {
                border = "rounded",
            },
        },
    },

    -- Formatting
    {
        "nvimtools/none-ls.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            local null_ls = require("null-ls")

            local limit = "88"

            null_ls.setup({
                sources = {
                    null_ls.builtins.formatting.stylua.with({
                        extra_args = {
                            "--column-width",
                            limit,
                        },
                    }),

                    null_ls.builtins.formatting.black.with({
                        extra_args = {
                            "--line-length",
                            limit,
                        },
                    }),
                },
            })
        end,
    },
}

