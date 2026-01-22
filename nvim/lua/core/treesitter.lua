local ok, configs = pcall(require, "nvim-treesitter.configs")
if not ok then
    return
end

configs.setup({
    ensure_installed = {
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "json",
        "lua",
        "vim",
        "vimdoc",
    },
    auto_install = true,

    highlight = { enable = true },
    indent = { enable = true },
})
