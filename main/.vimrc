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
    set ignorecase
    inoremap jk <ESC>

" Goyo
    map <leader>g :Goyo \| set linebreak<CR>

" Powerline Shell
    set rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/
    set laststatus=2
    set t_Co=256

" Highlight searches and Leader L to unhighlight
    set hlsearch
    nnoremap <leader>l :nohl<CR><C-l>

" Tabs
    set tabstop=4
    set shiftwidth=4
    set expandtab
    set autoindent
    set smartindent

" Compile groff document
    map <leader>a :!groff -ms % -T pdf > /tmp/out.pdf<CR><CR>
