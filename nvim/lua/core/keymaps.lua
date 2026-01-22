local map = vim.keymap.set

vim.g.mapleader = " "

-- Clear search highlight
map("n", "<leader>c", ":nohlsearch<CR>")

-- File tree
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- Delete without yank
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d')

-- Comment
vim.keymap.set("n", "<leader>/", "gcc", { remap = true })
vim.keymap.set("v", "<leader>/", "gc", { remap = true })

vim.keymap.set("n", "<leader>o", vim.diagnostic.open_float)
vim.keymap.set("n", "<leader><Left>", vim.diagnostic.goto_prev)
vim.keymap.set("n", "<leader><Right>", vim.diagnostic.goto_next)
