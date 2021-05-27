" UI
syntax on
syntax enable
set background=dark
colorscheme desert
set number
set relativenumber
set colorcolumn=80
set cursorcolumn
set cursorline
set backspace=indent,eol,start
hi ColorColumn ctermbg=0
hi CursorLine cterm=None ctermbg=0
hi CursorLineNr cterm=bold ctermbg=0
hi CursorColumn ctermbg=0
set mouse=a
filetype plugin indent on
set wildmenu
set wildmode=list:longest,full
set autoindent
set shiftwidth=2
set expandtab
set tabstop=2
set softtabstop=2
set hlsearch
set tags=tags;
set updatetime=100
set autochdir
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/
autocmd BufWritePre * :%s/\s\+$//e
au BufNewFile,BufRead *.cu set ft=cu
au BufNewFile,BufRead *.cuh set ft=cu

" customized
" 1. restore the position of cursor
function! ResCur()
  if line("'\"") <= line("$")
    silent! normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END

" 2. undo file
" set backup                  " Backups are nice ...
if has('persistent_undo')
  set undofile                " So is persistent undo ...
  set undolevels=1000         " Maximum number of changes that can be undone
  set undoreload=10000        " Maximum number lines to save for undo on a buffer reload
  set undodir=~/.vimundo
endif

" Mapping
nnoremap ; :
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-L> <C-W>l<C-W>_
map <C-H> <C-W>h<C-W>_
let mapleader = "\<space>"
inoremap <silent><expr> <TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" Plug
call plug#begin('~/.vim/plugged')

" neocomplete
let g:neocomplete#enable_at_startup = 1

" airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'mhinz/vim-signify'
Plug 'neoclide/coc-git'
Plug 'tpope/vim-fugitive'
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols#branch = ''
let g:airline_symbols#readonly = ''
let g:airline_symbols#linenr = '☰'
let g:airline_symbols#maxlinenr = ''
let g:airline_symbols#dirty='⚡'
let g:airline_theme = 'solarized'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#exclude_preview = 1

" easymotion
Plug 'easymotion/vim-easymotion'

" surround
Plug 'tpope/vim-surround'
call plug#end()
