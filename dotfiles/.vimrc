"        _
" __   _(_)_ __ ___  _ __ ___
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
"   \_/ |_|_| |_| |_|_|  \___|

" Folding {{{

let mapleader = " "
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=syntax
autocmd FileType vim nnoremap <CR> za

" }}}

" Plugins {{{

" Automatically download Plugged if not installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins using Plugged
call plug#begin('~/.vim/plugged')

" YCM
    Plug 'Valloric/YouCompleteMe'

" unicode.vim
    Plug 'chrisbra/unicode.vim'

" undotree
    Plug 'mbbill/undotree'

" autoclose
    Plug 'Townk/vim-autoclose'

" vim-surround
    Plug 'tpope/vim-surround'

" NERD commenter
    Plug 'preservim/nerdcommenter'

" fzf
    Plug '~/.fzf'

" vim-go
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" CSS color
    Plug 'ap/vim-css-color'

" vim-airline
 	Plug 'vim-airline/vim-airline'

" vim-airline-themes
    Plug 'vim-airline/vim-airline-themes'

" vim-devicons
    Plug 'ryanoasis/vim-devicons'

" one dark
    Plug 'joshdick/onedark.vim'

call plug#end()

" }}}

" Basics {{{

    filetype plugin on

    set nocompatible
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

" undo directory
    set noswapfile
    set nobackup
    set undodir=~/.vim/undodir
    set undofile

" Tabs
    set tabstop=4
    set softtabstop=4
    set shiftwidth=4
    set expandtab
    set autoindent

"Disable auto-commenting
    autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Remove trailing white space on save
    autocmd BufWritePre * %s/\s\+$//e

" Highlight searches and <Leader Leader> to unhighlight
    set incsearch
    set hlsearch
    nnoremap <silent> <leader><leader> :nohl<CR><C-l>

" }}}

" Window Splits {{{

" Fix splits
    set splitbelow splitright

" Remap <Ctrl-W>v to open blank
    nnoremap <C-w>v :vnew<CR>

" <Ctrl-W>h to open blank horizontally
    nnoremap <C-w>h :new<CR>

" Move windows
    noremap <leader>h <C-w>h
    map <leader>j <C-w>j
    map <leader>k <C-w>k
    map <leader>l <C-w>l

" }}}

" Aesthetics {{{

" Set airline theme
    set t_Co=256

    let g:airline_powerline_fonts = 1
    let g:airline_theme='powerlineish'

    if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif

" colors
    colorscheme onedark
    hi Normal guibg=NONE ctermbg=NONE
    highlight LineNr ctermfg=lightblue
    hi CursorLineNr ctermfg=darkmagenta

" }}}

" Plugins Settings {{{

" fzf
    map <C-g> :FZF<CR>

" YCM
    nnoremap <silent> gd :YcmCompleter GoTo<CR>

" Vim-Go
    nnoremap <C-h> :GoRename<CR>
    nnoremap <silent> <C-b> :GoRun<CR>
    nnoremap <silent> <C-k> :GoDoc<CR>

" Unicode Symbols
    imap <C-c> <Plug>(UnicodeFuzzy)
    nmap <C-c> i<Plug>(UnicodeFuzzy)

" undotree
    nnoremap <silent> <C-z> :UndotreeToggle<CR>

" comment
    nnoremap <silent> <C-a> :call NERDComment(0,"toggle")<CR>
    vnoremap <silent> <C-a> :call NERDComment(0,"toggle")<CR>

    let g:NERDSpaceDelims = 1
    let g:NERDCompactSexyComs = 1

" Enable devicons
    let g:webdevicons_enable = 1
    let g:webdevicons_enable_airline_statusline = 1

" turn off go display
    let g:go_echo_command_info = 0
    set completeopt-=preview

" }}}

" vim:foldmethod=marker:foldlevel=0
