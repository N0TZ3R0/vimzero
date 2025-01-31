" VimZero Default Configuration

" General Settings
set nocompatible
filetype plugin indent on
syntax on
set encoding=utf-8

" UI Configuration
set number
set relativenumber
set cursorline
set showmatch
set noshowmode
set laststatus=2
set signcolumn=yes
set termguicolors

" Indentation
set expandtab
set shiftwidth=4
set tabstop=4
set autoindent
set smartindent

" Search
set hlsearch
set incsearch
set ignorecase
set smartcase

" Performance
set lazyredraw
set updatetime=300

" Mappings
let mapleader = " "

" File navigation
nnoremap <leader>f :find *
nnoremap <leader>b :ls<CR>:buffer<Space>

" Window management
nnoremap <leader>w <C-w>w
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l

" Terminal
nnoremap <leader>t :terminal<CR>

" File operations
nnoremap <leader>s :write<CR>
nnoremap <leader>q :quit<CR>

" Misc
set backup
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undofile
set undodir=~/.vim/undo//
