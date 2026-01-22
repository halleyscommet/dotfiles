local ok, smear = pcall(require, "smear_cursor")
if not ok then
  return
end

smear.setup({
  smear_between_buffers = true,
  smear_between_neighbor_lines = true,
  scroll_buffer_space = true,
  legacy_computing_symbols_support = false,
})
