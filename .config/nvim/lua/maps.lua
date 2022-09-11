local keymap = vim.keymap
vim.cmd("imap jj <Esc>", { silent = true })

keymap.set('n', 'x', '"_x')

-- save and exit
keymap.set('n', '<Space>q', ':q<CR>')
keymap.set('n', '<Space>w', ':w<CR>')
keymap.set('n', '<A-q>', ':bd!<CR>')

-- comma to end
keymap.set("n", "<Space>;", "$a;<Esc>")
keymap.set("n", "<Space>,", "$a,<Esc>")

-- move lines
keymap.set("n", "<A-j>", ":m .+1<CR>==")
keymap.set("n", "<A-k>", ":m .-2<CR>==")
keymap.set("i", "<A-j>", "<Esc>:m .+1<CR>==gi")
keymap.set("i", "<A-k>", "<Esc>:m .-2<CR>==gi")
keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv")
keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv")

-- fast scrolling
keymap.set("n", "<C-j>", "10<C-e>")
keymap.set("n", "<C-k>", "10<C-y>")
keymap.set("n", "<C-l>", "20l")
keymap.set("n", "<C-h>", "20h")

-- open term
keymap.set('t', 'jj', '<C-\\><C-n>', { silent = true })
keymap.set('t', '<Esc>', '<C-\\><C-n>', { silent = true })
keymap.set('n', '<Space>ñ', '::belowright split | resize 8 | term<CR>i')

-- Increment/decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Delete a word backwards
keymap.set('n', 'dw', 'vb"_d')

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- Save with root permission (not working for now)
--vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})

-- New tab
keymap.set('n', 'te', ':tabedit<Return>', { silent = true })
-- Split window
keymap.set('n', 'ss', ':split<Return><C-w>w', { silent = true })
keymap.set('n', 'sv', ':vsplit<Return><C-w>w', { silent = true })
-- Move window
keymap.set('n', '<Space>', '<C-w>w')
keymap.set('', 'sh', '<C-w>h')
keymap.set('', 'sk', '<C-w>k')
keymap.set('', 'sj', '<C-w>j')
keymap.set('', 'sl', '<C-w>l')

-- Resize window
keymap.set('n', '<C-w><left>', '<C-w><')
keymap.set('n', '<C-w><right>', '<C-w>>')
keymap.set('n', '<C-w><up>', '<C-w>+')
keymap.set('n', '<C-w><down>', '<C-w>-')
