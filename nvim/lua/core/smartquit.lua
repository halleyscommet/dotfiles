local function smart_quit()
  local bufnr = vim.api.nvim_get_current_buf()

  if vim.bo[bufnr].buftype ~= "" then
    vim.cmd("quit")
    return
  end

  if vim.bo[bufnr].modified then
    vim.cmd("confirm bdelete")
  else
    vim.cmd("bdelete")
  end
end

vim.api.nvim_create_user_command("Q", smart_quit, {})

vim.cmd([[cnoreabbrev <expr> q    (getcmdtype() == ':' && getcmdline() == 'q')    ? 'Q' : 'q']])
vim.cmd([[cnoreabbrev <expr> quit (getcmdtype() == ':' && getcmdline() == 'quit') ? 'Q' : 'quit']])

