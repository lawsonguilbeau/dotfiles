-- for conciseness
local opt = vim.opt
local keymap = vim.keymap

vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "

-- Navigate vim panes better
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")

vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")
vim.wo.number = true

-- line numbers
opt.relativenumber = true -- show relative line numbers
opt.number = true -- shows absolute line number on cursor line (when relative number is on)

-- tabs & indentation
opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

-- line wrapping
opt.wrap = false -- disable line wrapping

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

-- cursor line
opt.cursorline = false -- highlight the current cursor line

-- appearance

-- turn on termguicolors for nightfly colorscheme to work
-- (have to use iterm2 or any other true color terminal)
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

opt.iskeyword:append("-") -- consider string-string as whole word

---------------------
-- General Keymaps
---------------------

-- use jk to exit insert and visual mode
keymap.set("i", "jk", "<ESC>")
keymap.set("v", "jk", "<ESC>")

keymap.set("n", "v", "v")

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- write and quit easily
keymap.set("n", "<leader>wq", ":wq<CR>")
keymap.set("n", "<leader>ww", ":w<CR>")
keymap.set("n", "<leader>qq", ":q<CR>")

-- Git
keymap.set("n", "<leader>gs", ":Git status<CR>")
keymap.set("n", "<leader>ga", ":Git add .<CR>")
keymap.set("n", "<leader>gc", ":Git commit -m ")
keymap.set("n", "<leader>go", ":Git push<CR>")

-- bufferline
keymap.set("n", "<leader>bl", ":BufferLinePick<CR>")
keymap.set("n", "<leader>bc", ":BufferLineCloseOthers<CR>")

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>") -- increment
keymap.set("n", "<leader>-", "<C-x>") -- decrement

-- window naviation
keymap.set("n", "<leader>kk", ":TmuxNavigateUp<CR>")
keymap.set("n", "<leader>jj", ":TmuxNavigateDown<CR>")
keymap.set("n", "<leader>hh", ":TmuxNavigateLeft<CR>")
keymap.set("n", "<leader>ll", ":TmuxNavigateRight<CR>")

-- window management
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") --  go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") --  go to previous tab
