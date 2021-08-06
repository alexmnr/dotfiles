" Plugins
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ap/vim-css-color'
Plug 'joshdick/onedark.vim'

call plug#end()

" Colors
colorscheme delek
let g:airline_theme='simple'

" Settings essential
syntax on
set number relativenumber
set clipboard=unnamedplus
set shiftwidth=4
set tabstop=4
set incsearch
set ignorecase
set smartcase

" Settings 
set nocompatible
filetype on
filetype plugin on
filetype indent on
set nowrap

" maybe sometime
"set cursorcolumn

" PLUGINS ---------------------------------------------------------------- {{{

" Plugin code goes here.

" }}}


" MAPPINGS --------------------------------------------------------------- {{{

" Mappings code goes here.

" }}}


" VIMSCRIPT -------------------------------------------------------------- {{{

" This will enable code folding.
" Use the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" More Vimscripts code goes here.

" }}}


" STATUS LINE ------------------------------------------------------------ {{{

" Status bar code goes here.

" }}}
