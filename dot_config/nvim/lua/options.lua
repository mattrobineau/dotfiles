local set = vim.opt
local cmd = vim.cmd

cmd [[syntax on]]
cmd [[filetype plugin indent on]]

set.compatible = false
set.history = 10000
set.expandtab = true        -- Insert space when tab is pressed
set.tabstop = 4             -- # of columns tab uses
set.shiftwidth = 4          -- # of columns for << and >>
set.softtabstop = 4
set.autoindent = true
set.laststatus = 2      -- # of lines for the status bar
set.cursorline = true   -- highlight current line
set.cmdheight = 1
set.switchbuf = 'useopen'
set.showtabline = 1
set.scrolloff = 6       -- leave 3 lines at bottom of scroll
set.backspace = { 'indent', 'eol', 'start' }
set.showcmd = false
set.showmode = false
set.wildmode = 'longest,list'
set.wildmenu = true
set.joinspaces = false
set.mouse = 'a'
set.splitright = true
set.splitbelow = true
set.hidden = true
set.foldmethod = 'syntax'
set.foldenable = false 
set.autoread = true
set.termguicolors = true
set.encoding = 'utf-8'
set.number = true
set.relativenumber = true
set.backup = false
set.writebackup = false
set.fileformats = { 'unix', 'dos' }
-- Show hidden characters
set.list = true
set.listchars = {
    tab = "→ ",
    nbsp = "¬",
    trail = "•",
    extends = "»",
    precedes = "«"
}

-- Auto complete
set.completeopt = { 'menuone', 'noinsert', 'noselect' }

-- Wrapping
set.wrap = false
table.insert(set.formatoptions, "tc")
table.insert(set.formatoptions, "r")
table.insert(set.formatoptions, "b")
table.insert(set.formatoptions, "n")

-- Search
set.incsearch = true
set.hlsearch = true
set.ignorecase = true
set.smartcase = true		-- case-sensitive search only if term contains upper-case chars

-- Diff
table.insert(set.diffopt, "algorithm:patience")
table.insert(set.diffopt, "indent-heuristic")

-- rust.vim
vim.g['rustfmt_autosave'] = 1
