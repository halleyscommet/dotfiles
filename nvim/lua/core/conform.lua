require("conform").setup({
    formatters_by_ft = {
        java = {},
    },

    default_format_opts = {
        lsp_format = "fallback",
        timeout_ms = 3000,
    },
})
