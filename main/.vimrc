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
    Plug 'junegunn/goyo.vim'

" fzf
    Plug '~/.fzf'

" vimwiki
    Plug 'vimwiki/vimwiki'

" pywal
    Plug 'dylanaraps/wal.vim'

" vim-airline
 	Plug 'vim-airline/vim-airline'

" vim-airline-themes
    Plug 'vim-airline/vim-airline-themes'

"fugitive
    Plug 'tpope/vim-fugitive'

"vim-devicons
    Plug 'ryanoasis/vim-devicons'

call plug#end()

" Basics
    set nocompatible
    filetype plugin on
    set encoding=utf-8
    syntax on
    set showcmd

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

" Set airline theme
    set t_Co=256

    let g:airline_powerline_fonts = 1
    let g:airline_theme='powerlineish'

    if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif

" Goyo
    map <leader>g :Goyo<CR>

    " Remove trailing white space on save
    autocmd BufWritePre * %s/\s\+$//e

" fzf
    map <C-g> :FZF<CR>

" Highlight searches and <Leader Leader> to unhighlight
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

" Vim Wiki
    let g:vimwiki_list = [{'path': '~/.vimwiki/',
                          \ 'syntax': 'markdown', 'ext': '.md'}]

" Enable Goyo by default for writing certain files
    autocmd BufRead,BufNewFile *.md :Goyo 80
    autocmd BufRead vimtutor :Goyo 80

" Enable devicons
    let g:webdevicons_enable = 1
    let g:webdevicons_enable_airline_statusline = 1
