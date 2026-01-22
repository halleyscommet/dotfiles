-- lua/core/options.lua
local opt = vim.opt

-- UI
opt.number = true
opt.relativenumber = false
opt.cursorline = true
opt.signcolumn = "yes"
opt.termguicolors = true

-- Editing
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true
opt.wrap = false

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true

-- Behavior
opt.swapfile = false
opt.backup = false
opt.undofile = true
opt.clipboard = "unnamedplus"
opt.scrolloff = 8
opt.sidescrolloff = 8

-- Performance
opt.updatetime = 250

vim.diagnostic.config({
    virtual_text = false, -- keeps code clean (recommended)
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
})
