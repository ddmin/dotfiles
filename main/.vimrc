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

" vim-airline
Plug 'https://github.com/vim-airline/vim-airline.git'

" vim-airline-themes
Plug 'https://github.com/vim-airline/vim-airline-themes.git'

"fugitive
Plug 'https://github.com/tpope/vim-fugitive.git'

call plug#end()

" Basics
    set nocompatible
    filetype plugin on
    set encoding=utf-8
    syntax on

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
    let g:airline_powerline_fonts = 1
    let g:airline_theme='powerlineish'

    if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif

    " unicode symbols
    let g:airline_left_sep = '»'
    let g:airline_left_sep = '▶'
    let g:airline_right_sep = '«'
    let g:airline_right_sep = '◀'
    let g:airline_symbols.linenr = '␊'
    let g:airline_symbols.linenr = '␤'
    let g:airline_symbols.linenr = '¶'
    let g:airline_symbols.branch = '⎇'
    let g:airline_symbols.paste = 'ρ'
    let g:airline_symbols.paste = 'Þ'
    let g:airline_symbols.paste = '∥'
    let g:airline_symbols.whitespace = 'Ξ'

    " airline symbols
    let g:airline_left_sep = ''
    let g:airline_left_alt_sep = ''
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = ''
    let g:airline_symbols.branch = ''
    let g:airline_symbols.readonly = ''
    let g:airline_symbols.linenr = ''

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

" Vim Wiki
    let g:vimwiki_list = [{'path': '~/.vimwiki/',
                          \ 'syntax': 'markdown', 'ext': '.md'}]

" Enable Goyo by default for writing certain files
    autocmd BufRead,BufNewFile *.md :Goyo 80
    autocmd BufRead vimtutor :Goyo 80
    autocmd BufRead,BufNewFile *.txt :Goyo 80
