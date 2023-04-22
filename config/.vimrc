" Plugins
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'joom/vim-commentary'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'terryma/vim-multiple-cursors'
Plug 'sheerun/vim-polyglot'
Plug 'alvan/vim-closetag'

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
command W :execute ':silent w !sudo tee % > /dev/null' | :edit!
" Moving lines
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" Colors
colorscheme dalek
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

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch

autocmd bufwritepost ~/.config/kitty/kitty.conf :silent !kill -SIGUSR1 $(pgrep kitty)

"These are to cancel the default behavior of d, D, c, C
"  to put the text they delete in the default register.
"  Note that this means e.g. "ad won't copy the text into
"  register a anymore.  You have to explicitly yank it.
nnoremap d "_d
vnoremap d "_d
nnoremap D "_D
vnoremap D "_D
nnoremap c "_c
vnoremap c "_c
nnoremap C "_C
vnoremap C "_C
