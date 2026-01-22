local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local group = augroup("CoreAutocmds", { clear = true })

-- Highlight on yank
autocmd("TextYankPost", {
    group = group,
    callback = function()
        vim.highlight.on_yank({ timeout = 200 })
    end,
})

-- Resize splits when window resizes
autocmd("VimResized", {
    group = group,
    command = "wincmd =",
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "c", "cpp", "cs" },
    callback = function()
        pcall(vim.treesitter.start)
    end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function(args)
        require("conform").format({
            bufnr = args.buf,
            lsp_fallback = true,
        })
    end,
})

vim.api.nvim_create_autocmd("CursorHold", {
    callback = function()
        vim.diagnostic.open_float(nil, {
            focus = false,
            scope = "cursor",
            border = "rounded",
        })
    end,
})
