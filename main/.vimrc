"        _                    
" __   _(_)_ __ ___  _ __ ___ 
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__ 
"   \_/ |_|_| |_| |_|_|  \___|

let mapleader =" "

call plug#begin('~/.vim/plugged')

" goyo.vim
Plug 'https://github.com/junegunn/goyo.vim'

call plug#end()

" Basics
    set nocompatible
    filetype plugin on
    set encoding=utf-8
    set number
    set relativenumber
    set ignorecase
    inoremap jk <ESC>
    set wildmenu

" Goyo
    map <leader>g :Goyo<CR>

" Powerline Shell
    set rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/
    set laststatus=2
    set t_Co=256

" Highlight searches and Leader L to unhighlight
    set hlsearch
    nnoremap <leader><leader> :nohl<CR><C-l>

" Tabs
    set tabstop=4
    set shiftwidth=4
    set expandtab
    set autoindent

" Move windows
    map <leader>h <C-w>h
    map <leader>j <C-w>j
    map <leader>k <C-w>k
    map <leader>l <C-w>l

" Compile groff document
    map <leader>a :w<CR>:!groff -ms % -T pdf > /tmp/out.pdf<CR><CR>
