local plug = require("core.plug")

local fn = vim.fn

vim.cmd("runtime autoload/plug.vim")

plug.begin()

_G.Plug = plug.Plug

Plug("tpope/vim-surround")
Plug("tpope/vim-repeat")
Plug("tpope/vim-commentary")

Plug("junegunn/fzf", { ["do"] = function() vim.fn["fzf#install"]() end })
Plug("junegunn/fzf.vim")

Plug("nvim-treesitter/nvim-treesitter", { ["do"] = ":TSUpdate" })

Plug("nvim-tree/nvim-tree.lua")
Plug("nvim-tree/nvim-web-devicons")

Plug("echasnovski/mini.nvim")

Plug("sphamba/smear-cursor.nvim")

Plug("hrsh7th/nvim-cmp")
Plug("hrsh7th/cmp-nvim-lsp")
Plug("hrsh7th/cmp-buffer")
Plug("hrsh7th/cmp-path")

Plug("L3MON4D3/LuaSnip")
Plug("saadparwaiz1/cmp_luasnip")

Plug("karb94/neoscroll.nvim")

Plug("neovim/nvim-lspconfig")
Plug("williamboman/mason.nvim")
Plug("williamboman/mason-lspconfig.nvim")

Plug("stevearc/conform.nvim")

Plug("uga-rosa/ccc.nvim")
Plug("farias-hecdin/CSSVarHighlight")
Plug("windwp/nvim-ts-autotag")

plug.finish()

if fn.empty(fn.glob(fn.stdpath("data") .. "/plugged")) == 0 then
else
    vim.cmd("autocmd VimEnter * PlugInstall --sync | source $MYVIMRC")
end

vim.cmd("filetype plugin indent on")
vim.cmd("syntax on")

require("core.options")
require("core.keymaps")
require("core.autocmds")
require("core.fzf")
require("core.treesitter")
require("core.filetree")
require("core.smartquit")
require("core.animations")
require("core.smear")
require("core.cmp")
require("core.lsp")
require("core.neoscroll")
require("core.conform")
require("core.autotag")
require("core.ccc")
require("core.cssvarhighlight")
