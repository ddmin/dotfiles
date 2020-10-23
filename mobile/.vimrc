"        _
" __   _(_)_ __ ___  _ __ ___
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
"   \_/ |_|_| |_| |_|_|  \___|

let mapleader = " "

" Basics
    set nocompatible
    filetype plugin on
    set encoding=utf-8
    set showcmd

    syntax on
    set wrap
    set linebreak
    set nolist

    set number
    set relativenumber

    set ic
    inoremap jk <ESC>
    set wildmenu

" Fix splits
    set splitbelow splitright

"Disable auto-commenting
    autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Highlight searches and <Leader Leader> to unhighlight
    set incsearch
    set hlsearch
    nnoremap <leader><leader> :nohl<CR><C-l>

" Tabs
    set tabstop=4
    set shiftwidth=4
    set expandtab
    set autoindent

" Remap <Ctrl-W>v to open blank
    nnoremap <C-w>v :vnew<CR>

" <Ctrl-W>h to open blank horizontally
    nnoremap <C-w>h :new<CR>

" Move windows
    noremap <leader>h <C-w>h
    map <leader>j <C-w>j
    map <leader>k <C-w>k
    map <leader>l <C-w>l
