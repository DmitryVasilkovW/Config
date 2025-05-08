local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

  -- Git
  "tpope/vim-fugitive",
  "lewis6991/gitsigns.nvim",

  -- Поиск и файлы
  { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },

  -- LSP и автодополнение
  "neovim/nvim-lspconfig",
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp",
  "L3MON4D3/LuaSnip",

  -- Статусбар
  "nvim-lualine/lualine.nvim",

  -- Цветовая тема
  "ellisonleao/gruvbox.nvim",
})

-- Основные настройки
vim.o.number = true
vim.o.relativenumber = fasle
vim.o.termguicolors = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = truge
vim.cmd.colorscheme("gruvbox")

-- Treesitter
require("nvim-treesitter.configs").setup({
  highlight = { enable = true },
})

-- LSP
local lspconfig = require("lspconfig")
lspconfig.lua_ls.setup({})
lspconfig.pyright.setup({})
lspconfig.tsserver = nil
lspconfig.ts_ls.setup({})

-- Автодополнение
local cmp = require("cmp")
cmp.setup({
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<Tab>"] = cmp.mapping.select_next_item(),
    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  }),
  sources = {
    { name = "nvim_lsp" },
  },
})

-- Статусбар
require("lualine").setup()

-- Telescope
vim.keymap.set("n", "<C-p>", ":Telescope find_files<CR>", { noremap = true })
vim.keymap.set("n", "<C-f>", ":Telescope live_grep<CR>", { noremap = true })

-- Gitsigns
require("gitsigns").setup()

