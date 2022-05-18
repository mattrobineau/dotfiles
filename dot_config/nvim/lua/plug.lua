-- Vim plug setup

local Plug = vim.fn['plug#']
vim.call('plug#begin', vim.fn.stdpath("data") .. '/plugged')

    -- Rooter
    Plug 'L3MON4D3/LuaSnip'

    -- LSP config
    Plug'neovim/nvim-lspconfig'

    -- LSP autocomplete
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-nvim-lua'

    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'saadparwaiz1/cmp_luasnip' -- snipets
    Plug 'onsails/lspkind-nvim' -- show source of autocomplete
    Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
--    Plug 'ray-x/lsp_signature.nvim' -- show method signatures
    -- Colorschemes
    Plug 'chriskempson/base16-vim'

    -- UI & Lang support
    Plug 'itchyny/lightline.vim'
    Plug 'rust-lang/rust.vim'

    -- Telescope
    -- fzf-native requires make to install (and gcc?)
    -- choco install mingw
    -- choco install make
    Plug 'airblade/vim-rooter'
    Plug 'nvim-lua/plenary.nvim'
    Plug('nvim-telescope/telescope-fzf-native.nvim', { ['do'] = 'make' })
    Plug 'nvim-telescope/telescope.nvim'
    -- Tree Sitter
    Plug('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })

    -- Cheatsheet
    Plug 'nvim-lua/popup.nvim'
    Plug('mattrobineau/cheatsheet.nvim', { branch = 'bugfix/windows' })

vim.call('plug#end')

-- Call plugin configurations. vim plug will no do this for us
require('configs.lspconfig').config()
require('configs.cmp').config()
require('configs.vim_rooter').config()
require('configs.telescope').config()
