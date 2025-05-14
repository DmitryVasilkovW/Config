local lspconfig = require("lspconfig")

lspconfig.lua_ls.setup({})
lspconfig.pyright.setup({})
lspconfig.tsserver = nil
lspconfig.ts_ls.setup({})

-- haskell
require("lspconfig").hls.setup({
    filetypes = { "haskell", "lhaskell" },
})
