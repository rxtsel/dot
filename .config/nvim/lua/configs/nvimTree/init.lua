require "variables"

g.nvim_tree_quit_on_open = 1
g.nvim_tree_indent_markers = 1

require'nvim-tree'.setup {
        view = {
          width = 30,
          height = 30,
          hide_root_folder = true,
          side = 'left',
          auto_resize = true,
          mappings = {custom_only = false, list = {}},
        },
          number = true,
          relativenumber = true,
          filters = {
            dotfiles = true,
            custom = { 'pycache', '.git', 'node_modules', 'README.md'}
        }
}
