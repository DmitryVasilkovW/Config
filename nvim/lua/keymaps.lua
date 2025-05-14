vim.keymap.set("n", "<C-p>", ":Telescope find_files<CR>", { noremap = true })
vim.keymap.set("n", "<C-f>", ":Telescope live_grep<CR>", { noremap = true })
vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

