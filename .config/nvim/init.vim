" ----- Plugins -----
call plug#begin()
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'itchyny/lightline.vim'
Plug 'yggdroot/indentline'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'hrsh7th/vim-vsnip'
Plug 'jiangmiao/auto-pairs'

Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/cmp-vsnip'
call plug#end()

" ----- Theme -----
set background=dark
colorscheme palenight
let g:lightline = { 'colorscheme': 'palenight' }
set termguicolors
" transparent background
highlight Normal guibg=NONE 

" ----- Goyo/Limelight Settings -----
let g:goyo_width = '80%'
function! s:goyo_enter()
    set noshowcmd
    set scrolloff=999
    set nocursorline
    Limelight
    " clear :Goyo command
    echon ''
endfunction
function! s:goyo_leave()
    set showcmd
    set scrolloff=10
    set cursorline
    Limelight!
    highlight Normal guibg=NONE
endfunction
autocmd! user GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

" ----- Keymaps -----
" use ctrl-[movement] to navigate between splits
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
" reload init.vim
map <C-s> :source ~/.config/nvim/init.vim<CR>
" move visual-line select up/down
xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv
" open Goyo
nnoremap <C-g> :Goyo<CR>

" ----- General Settings -----
set scrolloff=10 " keep cursor 15 lines from screen extents
set nocompatible " enter the current millenium
set number " line numbers
set guicursor=n-v-c:block-Cursor " block cursor
" 4-space tab configuration
set autoindent
set tabstop=4
set shiftwidth=4
set smarttab
set softtabstop=4
set expandtab
syntax enable " syntax hightlighting
set encoding=utf-8
set fileencoding=utf-8
set belloff=all " NO bell sounds
set hls is " highlights words when searching
set autoread " auto read file when changed outside editor
set ic
set cursorline
set wrap linebreak nolist " soft wrap lines
filetype plugin on " enable netrw plugin
set completeopt=menu,menuone,noselect

" ----- lua -----
lua << EOF
local cmp = require'cmp'
cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' }
    })
})

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local lsp_installer = require("nvim-lsp-installer")
lsp_installer.on_server_ready(function(server)
    local opts = { capabilities = capabilites }
    server:setup(opts)
end)
require("gitsigns").setup()
EOF
