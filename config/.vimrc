" Plugins
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'joom/vim-commentary'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

call plug#end()

" Keybindings
map H ^^
map L $
nnoremap <SPACE> <Nop>
let mapleader="m"
map <C-u> :redo <CR>
map <C-s> :source % <CR>
map <leader>n :noh <CR>
map U :redo <CR>
map K 5k
map J 5j
" cnoremap w!! w !sudo tee > /dev/null %
command W :execute ':silent w !sudo tee % > /dev/null' | :edit!

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
let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
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

set timeoutlen=0 
set ttimeoutlen=5 
" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch

