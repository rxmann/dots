-- Go up a directory using Backspace when inside a netrw buffer
vim.api.nvim_create_autocmd("FileType", {
  pattern = "netrw",
  callback = function()
    vim.keymap.set("n", "<BS>", "-", { remap = true, buffer = true, desc = "Netrw: Go up one level" })
  end,
})