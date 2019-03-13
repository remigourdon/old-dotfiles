""""""""""""
" VIM-PLUG "
""""""""""""

call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-surround'
Plug 'jreybert/vimagit'
Plug 'bling/vim-airline'
Plug 'tpope/vim-commentary'
Plug 'vifm/vifm.vim'
call plug#end()

"""""""""""
" GENERAL "
"""""""""""

" Vi improved
set nocompatible

" Enable plugins
filetype plugin on

" Remap leader
let mapleader=","

" More natural split opening
set splitbelow
set splitright

" Enable mouse
set mouse=a

" Disable swap files
set noswapfile

""""""""""
" DISLAY "
""""""""""

" Syntax highlighting
syntax enable

" Hybrid numbering
set relativenumber number

" Tabs and spaces
set tabstop=4 shiftwidth=4 expandtab

" Intendation
set autoindent

"""""""""""""""""
" FINDING FILES "
"""""""""""""""""

" Tab completion for all file-related tasks
set path+=**

" Display all matching files on tab complete
set wildmenu
set wildmode=list:longest,full

"""""""""""""
" UTILITIES "
"""""""""""""

" Check file in shellcheck:
map <leader>s :!clear && shellcheck %<CR>
