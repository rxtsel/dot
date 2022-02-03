require "variables"

g.mapleader = ' '
cmd('imap jj <Esc>')
cmd('imap JJ <Esc>')

--SAVE AND EXIT
map('n', '<space>q', ':q<CR>')
map('n', '<space>w', ':w<CR>')
map('n', '<space>Q', ':q!<CR>')

--NVIM-TREE
map('n', '<space>n', ':NvimTreeToggle<CR>')

--NVIM-COMMENTS
map('n', '<space>cc', ':CommentToggle<CR>')
map('x', '<space>cc', ":'<,'>CommentToggle<CR>")
map('n', '<Leader>;', '$a;<Esc>')

--SELECT All
map("n", "<C-a>", 'ggVG')

--DELETE DOESN'T COPY PORTAPAPELES
map("v", "<bs>", '"_d')

--HOP-NVIM
map("n", "<leader>s", ":HopChar2<CR>")

--TELESCOPE
map("n", "<leader>ff", ":lua require('telescope.builtin').find_files()<CR>")
map("", "<leader>fb", ":lua require('telescope.builtin').buffers()<CR>")
map("n", "<leader>fg", ":lua require('telescope.builtin').live_grep()<CR>")
map("n", "<leader>fo", ":lua require('telescope.builtin').oldfiles()<CR>")

--WINDOW NAVIGATION
map('n', '<C-h>', '<C-w>h')
map('n', '<C-l>', '<C-w>l')

--DESPLAZAR LINEAS
map("n", "<A-j>", ":m .+1<CR>==")
map("n", "<A-k>", ":m .-2<CR>==")
map("i", "<A-j>", "<Esc>:m .+1<CR>==gi")
map("i", "<A-k>", "<Esc>:m .-2<CR>==gi")
map("v", "<A-j>", ":m '>+1<CR>gv=gv")
map("v", "<A-k>", ":m '<-2<CR>gv=gv")

--CAMBIAR TAMAÑO DE VENTANAS
map("n", "<A-Down>", ":exe 'resize ' . (winheight(0) * 3/2)<CR>")
map("n", "<A-Up>", ":exe 'resize ' . (winheight(0) * 2/3)<CR>")
map("n", "<A-Left>", ":vertical resize -2<CR>")
map("n", "<A-Right>", ":vertical resize +2<CR>")

--FAST-SCROLLING
map('n', '<C-j>', '10<C-e>')
map('n', '<C-k>', '10<C-y>')

--TERM
map("n", "<C-t>", ':term<CR>')
map("t", "jj", '<C-\\><C-n>')

--IDENT
map("n", "<C-i>", 'gg=G')   --ident all document

--MOVE BETWEEN TABS
map("n", "<A-l>", ":bn<CR>")
map("n", "<A-h>", ":bp<CR>")
map("n", "<A-q>", ":bd!<CR>") --cerrar pestaña

--FOLDS
map("n", "F", 'za')
map("v", "f", 'zf')
--commmands folds
-- zf : Crear
-- zd : Eliminar
-- zE: Eliminar todos
-- za: Toggle
-- zR: Mostrar todos
-- zM: Cerrar todos
