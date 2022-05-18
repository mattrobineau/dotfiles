local opts = { noremap = true, silent = true }

local map = vim.api.nvim_set_keymap

-- Map space as leader key
map('', '<Space>', '<Nop>', opts)
vim.g.mapleader = ' '
vim.g.localmapleader = ' '
vim.api.nvim_set_keymap('n', '<Leader>w', ':write<CR>', {noremap = true})

-- # Easy copy pasta
map('n', '<leader>y', '\"+y', opts)
map('n', '<leader>p', '\"+p', opts)
map('n', '<leader>P', '\"+P', opts)

map('v', '<leader>y', '\"+y', opts)
map('v', '<leader>p', '\"+p', opts)
map('v', '<leader>P', '\"+P', opts)

-- Center searches
map('n', 'n', 'nzz', opts)
map('n', 'N', 'Nzz', opts)
map('n', '*', '*zz', opts)
map('n', '#', '#zz', opts)
map('n', 'g*', 'g*zz', opts)

-- Easier split navigation
map('n', '<c-j>', '<c-w>j', opts)
map('n', '<c-k>', '<c-w>k', opts)
map('n', '<c-h>', '<c-w>h', opts)
map('n', '<c-l>', '<c-w>l', opts)

-- Easier head/tail
map('n', 'H', '^', opts)
map('n', 'L', '$', opts)
map('v', 'H', '^', opts)
map('v', 'L', '$', opts)

-- Clear search highlight
map('n', '<Esc>', ':noh<CR>', opts)
map('n', '<c-c>', ':noh<CR>', opts)
map('i', '<c-c>', '<cmd>noh<CR>', opts)

-- Open root config
map('n', '<leader><leader>c', '<cmd>Ex c:/Users/micro/AppData/Local/nvim<CR>', opts)

-- Rust
vim.g['rust_fmt_autosave'] = 1
