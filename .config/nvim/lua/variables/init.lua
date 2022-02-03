wo = vim.wo
o = vim.o
cmd = vim.cmd
opt = vim.opt
g = vim.g
bo = vim.bo
map = function(mode, key, result)
  vim.api.nvim_set_keymap(mode, key, result, {noremap = true, silent = true})
end
