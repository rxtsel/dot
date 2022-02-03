require "variables"

--MAP LEADER ESC
g.mapleader = ' '
--REMAP ESC
cmd('imap jj <Esc>')

opt.termguicolors = true -- You will have bad experience for diagnostic messages when it's default 4000.
opt.backspace = { "indent", "eol", "start" }
opt.clipboard = "unnamedplus"
opt.completeopt = "menu,menuone,noselect"
opt.cursorline = true
opt.swapfile = false
opt.cursorcolumn = true
opt.encoding = "utf-8" -- Set default encoding to UTF-8
opt.expandtab = true -- Use spaces instead of tabs
opt.foldenable = false
opt.foldmethod = "indent"
opt.formatoptions = "l"
opt.hidden = true -- Enable background buffers
opt.hlsearch = false -- Highlight found searches
opt.ignorecase = true -- Ignore case
opt.inccommand = "split" -- Get a preview of replacements
opt.incsearch = true -- Shows the match while typing
opt.joinspaces = false -- No double spaces with join
vim.o.lazyredraw = true
opt.linebreak = true -- Stop words being broken on wrap
opt.number = true -- Show line numbers
opt.list = true -- Show some invisible characters
opt.listchars = { tab = " ", trail = "·" }
opt.relativenumber = true
opt.scrolloff = 4 -- Lines of context
opt.shiftround = true -- Round indent
opt.shiftwidth = 4 -- Size of an indent
opt.showmode = false -- Don't display mode
opt.sidescrolloff = 8 -- Columns of context
opt.signcolumn = "yes:1" -- always show signcolumns
opt.smartcase = true -- Do not ignore case with capitals
opt.smartindent = true -- Insert indents automatically
opt.spelllang = { "es_co" }
opt.splitbelow = true -- Put new windows below current
opt.splitright = true -- Put new windows right of current
opt.tabstop = 4 -- Number of spaces tabs count for
vim.o.whichwrap = vim.o.whichwrap .. "<,>" -- Wrap movement between lines in edit mode with arrows
opt.wrap = false
--opt.cc = "80"
opt.mouse = "a"

cmd("au TextYankPost * lua vim.highlight.on_yank {on_visual = true}") -- disabled in visual mode
-- Give me some fenced codeblock goodness
g.markdown_fenced_languages = { "html", "javascript", "typescript", "css", "scss", "lua", "vim" }

--DISABLE AUTOCOMMENTS FOR Oo
cmd [[autocmd BufWinEnter * :set formatoptions-=c formatoptions-=r formatoptions-=o]]

--AUTO RELOAD BUFFERS
cmd [[
      set autoread
      autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
      autocmd FileChangedShellPost *
        \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
]]

--HIDDE STATUS LINE IN LUALINE
cmd [[au BufEnter,BufWinEnter,WinEnter,CmdwinEnter * if bufname('%') == "NvimTree" | set laststatus=0 | else | set laststatus=2 | endif]]

--FOLDS
cmd [[:set foldmethod=manual 
:delm! | delm A-Z0-9]]

--DEFINE THEME
cmd [[colorscheme tokyonight]]
g.tokyonight_style = "night"
g.tokyonight_terminal_colors = true
g.tokyonight_dark_sidebar = true
g.tokyonight_colors = {hint = "orange", error = "#ff0000"}
o.background = "dark"
