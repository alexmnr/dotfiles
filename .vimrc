" Plugins
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ap/vim-css-color'
Plug 'joshdick/onedark.vim'

call plug#end()

" Keybindings
map H 0
map L $
map Q :wq <CR>
map <space> :noh <CR>
cmap w!! w !sudo tee > /dev/null %

" Colors
colorscheme delek
let g:airline_theme='simple'

" Settings essential
syntax on
set number relativenumber
set clipboard=unnamedplus
set shiftwidth=4
set tabstop=4

" Settings 
set nocompatible
filetype on
filetype plugin on
filetype indent on
set nowrap
set incsearch
set ignorecase
set smartcase
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch

" maybe sometime
"set cursorcolumn
