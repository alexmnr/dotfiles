" Plugins
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ap/vim-css-color'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

" Keybindings
map H ^^
map L $
nnoremap <SPACE> <Nop>
let mapleader=" "
map <C-q> :wq <CR>
map <C-Q> :q <CR>
map <C-w> :w <CR>
map <C-s> :source % <CR>
map <leader>7 :noh <CR>
cmap w!! w !sudo tee > /dev/null %

" Colors
colorscheme delek
let g:airline_theme='simple'

" Settings essential
syntax on
set number relativenumber
set clipboard=unnamedplus
set shiftwidth=4
set tabstop=4 softtabstop=4
set expandtab

" Settings 
set encoding=UTF-8
set nocompatible
filetype on
filetype plugin on
filetype indent on
set nowrap
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview
set nobackup
set undodir=~/.vim/undodir
set undofile

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
