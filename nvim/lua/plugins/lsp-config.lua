return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "ts_ls",
                    "pyright",
                    "ruff",
                },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspConfig = require("lspconfig")

            lspConfig.lua_ls.setup({})
            lspConfig.ts_ls.setup({})
            lspConfig.pyright.setup({
                settings = {
                    python = {
                        analysis = {
                            autoSearchPaths = true,
                            useLibraryCodeForTypes = true,
                            diagnosticMode = "workspace",
                        },
                    },
                },
                on_attach = function(client, bufnr)
                    client.server_capabilities.documentFormattingProvider = false
                    client.server_capabilities.documentRangeFormattingProvider = false
                end,
            })
            lspConfig.ruff.setup({
                on_attach = function(client, bufnr)
                    -- disable hover in favor of Pyright
                    client.server_capabilities.hoverProvider = false
                end,
            })

            vim.keymap.set("n", "<D-k>", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
            vim.keymap.set("n", "<leader>ce", vim.diagnostic.open_float, {})
        end,
    },
}
