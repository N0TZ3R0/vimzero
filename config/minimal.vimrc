" VimZero Minimal Configuration

set nocompatible
syntax on
filetype plugin indent on

" Basic settings
set number
set expandtab
set shiftwidth=4
set tabstop=4
set autoindent
set incsearch
set hlsearch

" Simple statusline
set laststatus=2
set statusline=%f\ %y\ %m\ %r\ %=%l,%c\ %P

" Basic leader mappings
let mapleader = " "
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
