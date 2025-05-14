-- Инициализация null-ls (нужно для автоформатирования)
local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting

local fourmolu = {
    method = null_ls.methods.FORMATTING,
    filetypes = { "haskell" },
    generator = null_ls.generator({
        command = "/Users/dmitryvasilkov/.local/bin/fourmolu",
        args = { "--stdin-input-file", "$FILENAME" },
        to_stdin = true,
    }),
}

null_ls.setup({
    sources = {
        -- lua
        null_ls.builtins.formatting.stylua,
        -- Haskell
        fourmolu,
    },
})

vim.api.nvim_create_autocmd("BufWritePre", {
    callback = function()
        vim.lsp.buf.format({ timeout_ms = 2000 })
    end,
})
