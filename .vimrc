call plug#begin()

" Plug 'vim-airline/vim-airline'
Plug 'itchyny/lightline.vim'
Plug 'yggdroot/indentline'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'dense-analysis/ale'
Plug 'DrTom/fsharp-vim'
Plug 'itchyny/calendar.vim'
Plug 'drewtempelmeyer/palenight.vim'

call plug#end()

set laststatus=2
set noshowmode

syntax on
colorscheme palenight
" let g:airline_theme='palenight'
let g:lightline = { 'colorscheme': 'palenight' }

set encoding=utf-8
set fileencoding=utf-8

set number

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

set belloff=all

set expandtab
set shiftwidth=4
set tabstop=4

let g:airline_powerline_fonts=1

" Linter options
let g:ale_linters={
\   'haskell': ['cabal_ghc', 'cspell', 'ghc_mod', 'hdevtool', 'hie', 'hlint', 'hls']
\}

" Fixer options
let g:ale_fixers={
\   '*': ['remove_trailing_lines', 'trim_whitespace']
\}
let g:ale_fix_on_save=1

" transparent bg
autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE
