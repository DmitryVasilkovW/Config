require("nvim-treesitter.configs").setup({
    ensure_installed = {
        "lua",
        "haskell",
    },
    highlight = { enable = true },
})
