-- lua/core/ccc.lua
local ok, ccc = pcall(require, "ccc")
if not ok then
    return
end

ccc.setup({})

-- Optional handy keymaps:
vim.keymap.set("n", "<leader>cp", "<cmd>CccPick<CR>", { desc = "Color pick" })
vim.keymap.set("n", "<leader>ct", "<cmd>CccHighlighterToggle<CR>", { desc = "Toggle color highlight" })
