"        _
" __   _(_)_ __ ___  _ __ ___
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
"   \_/ |_|_| |_| |_|_|  \___|

let mapleader =" "

" Automatically download Plugged if not installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins using Plugged
call plug#begin('~/.vim/plugged')

" goyo.vim
Plug 'https://github.com/junegunn/goyo.vim'

" fzf
Plug '~/.fzf'

" vimwiki
Plug 'https://github.com/vimwiki/vimwiki.git'

" pywal
Plug 'https://github.com/dylanaraps/wal.vim.git'

call plug#end()

" Basics
    set nocompatible
    filetype plugin on
    syntax on
    set encoding=utf-8

    set number
    set relativenumber

    set ic
    inoremap jk <ESC>
    set wildmenu

    colorscheme wal

" Fix splits
    set splitbelow splitright

" Remap <Ctrl-W>v to open blank
    nnoremap <C-w>v :vnew<CR>

"Disable auto-commenting
    autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Goyo
    map <leader>g :Goyo<CR>

    " Remove trailing white space on save
    autocmd BufWritePre * %s/\s\+$//e

" fzf
    map <C-g> :FZF<CR>

" Highlight searches and Leader L to unhighlight
    set incsearch
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

" Powerline Shell
    set rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/
    set laststatus=2
    set t_Co=256

" Vim Wiki
    let g:vimwiki_list = [{'path': '~/.vimwiki/',
                          \ 'syntax': 'markdown', 'ext': '.md'}]

" Enable Goyo by default for writing markdown
    autocmd BufRead,BufNewFile *.md :Goyo 80
