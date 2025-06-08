return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                -- lua
                null_ls.builtins.formatting.stylua,

                -- python
                null_ls.builtins.formatting.ruff,
                null_ls.builtins.diagnostics.ruff,
            },
        })

        -- format on save
        vim.api.nvim_create_autocmd("BufWritePre", {
            pattern = "*",
            callback = function()
                vim.lsp.buf.format({ timeout_ms = 2000 })
            end,
        })

        vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, {})
    end,
}
