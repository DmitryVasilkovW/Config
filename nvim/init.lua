-- Пакетный менеджер lazy.nvim
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
  -- Файловый менеджер в виде дерева
  "nvim-tree/nvim-tree.lua",

  -- Иконки файлов (для nvim-tree, lualine и других)
  "nvim-tree/nvim-web-devicons",

  -- Fuzzy-поиск файлов, строк и др.
  "nvim-telescope/telescope.nvim",

  -- Вспомогательная библиотека (обязательна для Telescope и других)
  "nvim-lua/plenary.nvim",

  -- Продвинутая подсветка синтаксиса и парсинг кода
  "nvim-treesitter/nvim-treesitter",

  -- Статусбар внизу
  "nvim-lualine/lualine.nvim",

  -- TODO-комментарии с подсветкой и поиском
  "folke/todo-comments.nvim",

  -- Работа с Git (аналог `git` внутри Neovim)
  "tpope/vim-fugitive",

  -- Отображение изменений в гите на полях (git diff)
  "lewis6991/gitsigns.nvim",

  -- Конфигурации LSP серверов (например, для Python, Lua и т.п.)
  "neovim/nvim-lspconfig",

  -- Ядро системы автодополнения
  "hrsh7th/nvim-cmp",

  -- Источник автодополнения от LSP
  "hrsh7th/cmp-nvim-lsp",

  -- Источник автодополнения из открытых буферов
  "hrsh7th/cmp-buffer",

  -- Источник автодополнения путей к файлам
  "hrsh7th/cmp-path",

  -- Движок сниппетов (шаблонов кода)
  "L3MON4D3/LuaSnip",

  -- Поддержка сниппетов в системе автодополнения
  "saadparwaiz1/cmp_luasnip",

  -- Автоматическое закрытие скобок, кавычек и т.п.
  "windwp/nvim-autopairs",

  -- Комментирование кода (`gc` + движение)
  "numToStr/Comment.nvim",

  -- UI-обёртка над LSP: подсказки, рефакторинг, подсветка и др.
  "glepnir/lspsaga.nvim",

  -- Тема Gruvbox (одна из двух подключённых)
  "ellisonleao/gruvbox.nvim",

  -- Тема Gruvbox с приоритетом и автоустановкой
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("gruvbox")
    end,
  },
})

config = function()
  require("gruvbox").setup({
    contrast = "hard",
  })
  vim.cmd.colorscheme("gruvbox")
end

--  Основные настройки
vim.o.number = true
vim.o.relativenumber = false
vim.o.termguicolors = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.cmd.colorscheme("gruvbox")

-- Treesitter
require("nvim-treesitter.configs").setup({
  highlight = { enable = true },
})

--  LSP
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

