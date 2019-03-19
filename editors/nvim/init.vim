""""""""""""
" VIM-PLUG "
""""""""""""

call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-surround'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
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

" Allow hiding buffers
set hid

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

"""""""""""
" AIRLINE "
"""""""""""

" Configuration
let g:airline#extensions#tabline#enabled = 1

" Airline theme
let g:airline_theme='solarized'
let g:airline_solarized_bg='light'

" Airline characters
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_powerline_fonts = 1

" Unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'

" Powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''

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
