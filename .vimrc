" Basic .vimrc

" Plugin Management (vim-plug)
call plug#begin('~/.vim/plugged')

" Fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Beautiful colorschemes
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
Plug 'folke/tokyonight.nvim'
Plug 'rebelot/kanagawa.nvim'

call plug#end()

" Colorscheme configuration
set termguicolors
set background=dark

" Choose one (uncomment your favorite after :PlugInstall):
colorscheme catppuccin_mocha
" colorscheme catppuccin_macchiato
" colorscheme catppuccin_frappe
" colorscheme tokyonight-night
" colorscheme tokyonight-storm
" colorscheme kanagawa

" Make it even prettier
set cursorline
highlight CursorLine cterm=NONE ctermbg=235 guibg=#2a2b3c
set signcolumn=yes

" Enable syntax highlighting
syntax on

" Enable line numbers
set number
set relativenumber

" Set indentation (4 spaces)
set tabstop=4
set shiftwidth=4
set expandtab

" Enable auto-indenting
set autoindent
set smartindent

" Use jk to exit insert mode
inoremap jk <Esc>

" Show matching brackets
set showmatch

" Better search
set hlsearch
set incsearch
set ignorecase
set smartcase

" Enable mouse support
set mouse=a

" Set encoding
set encoding=utf-8

set clipboard=unnamedplus

" Set leader key to space
let mapleader = " "

" FZF keybindings with leader
nnoremap <leader>sf :Files<CR>
nnoremap <leader>ss :Rg<CR>
nnoremap <leader>sb :Buffers<CR>

" Better colors for FZF
let g:fzf_colors = {
  \ 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
 
