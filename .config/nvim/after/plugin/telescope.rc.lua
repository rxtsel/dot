local status, telescope = pcall(require, "telescope")
if (not status) then return end
local actions = require('telescope.actions')

function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

telescope.setup {
  defaults = {
    mappings = {
      n = {
        ["<Space>e"] = actions.close,
        ["q"] = actions.close
      },
    },
  }
}

local opts = { noremap = true, silent = true }

vim.keymap.set('n', ',f', '<cmd>lua require("telescope.builtin").find_files({ no_ignore = false, hidden = true })<cr>',
  opts)
vim.keymap.set('n', ',r', '<cmd>lua require("telescope.builtin").live_grep()<cr>', opts)
vim.keymap.set('n', ',o', '<cmd>lua require("telescope.builtin").buffers()<cr>', opts)
vim.keymap.set('n', ',t', '<cmd>lua require("telescope.builtin").help_tags()<cr>', opts)
vim.keymap.set('n', ',,', '<cmd>lua require("telescope.builtin").resume()<cr>', opts)
vim.keymap.set('n', ',e', '<cmd>lua require("telescope.builtin").diagnostics()<cr>', opts)
