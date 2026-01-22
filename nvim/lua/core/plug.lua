local M = {}

-- Call vim-plug's Plug command from Lua
function M.Plug(repo, opts)
  if opts then
    vim.fn["plug#"](repo, opts)
  else
    vim.fn["plug#"](repo)
  end
end

function M.begin()
  vim.fn["plug#begin"](vim.fn.stdpath("data") .. "/plugged")
end

function M.finish()
  vim.fn["plug#end"]()
end

return M
