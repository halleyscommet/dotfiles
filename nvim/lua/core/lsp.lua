-- lua/core/lsp.lua (Neovim 0.11+)

-- Capabilities (for nvim-cmp)
local capabilities = vim.lsp.protocol.make_client_capabilities()
local ok_cmp, cmp_lsp = pcall(require, "cmp_nvim_lsp")
if ok_cmp then
    capabilities = cmp_lsp.default_capabilities(capabilities)
end

-- Shared on_attach
local on_attach = function(_, bufnr)
    local map = function(mode, lhs, rhs)
        vim.keymap.set(mode, lhs, rhs, { buffer = bufnr })
    end
    map("n", "gd", vim.lsp.buf.definition)
    map("n", "gr", vim.lsp.buf.references)
    map("n", "K", vim.lsp.buf.hover)
    map("n", "<leader>rn", vim.lsp.buf.rename)
    map("n", "<leader>ca", vim.lsp.buf.code_action)
end

-- Mason
local ok_mason, mason = pcall(require, "mason")
if not ok_mason then return end
mason.setup()

local ok_mlsp, mason_lspconfig = pcall(require, "mason-lspconfig")
if not ok_mlsp then return end

-- mason-lspconfig v2: setup_handlers is removed; use ensure_installed + (optional) automatic_enable
mason_lspconfig.setup({
    ensure_installed = {
        "ts_ls",     -- JS/TS
        "jdtls",     -- Java
        "omnisharp", -- C# / Unity
        "lua_ls",
        "pyright",
    },
    automatic_enable = true,
})

-- Define configs using Neovim's native API (nvim-lspconfig supplies the server definitions)
local function define(server, opts)
    vim.lsp.config(server, vim.tbl_deep_extend("force", {
        capabilities = capabilities,
        on_attach = on_attach,
    }, opts or {}))
end

-- Language servers
define("lua_ls", {
    settings = {
        Lua = {
            diagnostics = { globals = { "vim" } },
            workspace = { checkThirdParty = false },
        },
    },
})

define("pyright")
define("ts_ls")
define("jdtls")

define("omnisharp", {
    -- Some setups benefit from explicitly setting cmd:
    cmd = { "omnisharp", "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
})

-- Enable them
vim.lsp.enable({ "lua_ls", "pyright", "ts_ls", "jdtls", "omnisharp" })
