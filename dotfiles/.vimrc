"        _
" __   _(_)_ __ ___  _ __ ___
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
"   \_/ |_|_| |_| |_|_|  \___|

let mapleader = " "

" Automatically download Plugged if not installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins using Plugged
call plug#begin('~/.vim/plugged')

" deoplete
    if has('nvim')
      Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    else
      Plug 'Shougo/deoplete.nvim'
      Plug 'roxma/nvim-yarp'
      Plug 'roxma/vim-hug-neovim-rpc'
    endif

" vim-python
    Plug 'vim-python/python-syntax'

" vim-go
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" goyo.vim
    Plug 'junegunn/goyo.vim'

" fzf
    Plug '~/.fzf'

" pywal
    Plug 'dylanaraps/wal.vim'

" vim-airline
 	Plug 'vim-airline/vim-airline'

" vim-airline-themes
    Plug 'vim-airline/vim-airline-themes'

" fugitive
    Plug 'tpope/vim-fugitive'

" vim-devicons
    Plug 'ryanoasis/vim-devicons'

" one dark
    Plug 'joshdick/onedark.vim'

" dracula
    Plug 'dracula/vim', { 'as': 'dracula' }

call plug#end()

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

    colorscheme onedark
    " colorscheme dracula
    hi Normal guibg=NONE ctermbg=NONE
    " colorscheme wal

" Toggle Colors
    function ToggleColors()
        if (g:colors_name == "wal")
            :colorscheme onedark
        elseif (g:colors_name == "onedark")
            :colorscheme dracula
        else
            :colorscheme wal
        endif

        hi Normal guibg=NONE ctermbg=NONE
        echo g:colors_name
    endfunction

    nnoremap <C-b> :call ToggleColors()<CR>

" Fix splits
    set splitbelow splitright

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

" Remap <Ctrl-W>v to open blank
    nnoremap <C-w>v :vnew<CR>

" <Ctrl-W>h to open blank horizontally
    nnoremap <C-w>h :new<CR>

" Move windows
    noremap <leader>h <C-w>h
    map <leader>j <C-w>j
    map <leader>k <C-w>k
    map <leader>l <C-w>l

" Resize Horizontal Windows
    nnoremap <silent> <Leader>= :exe "resize " . (winheight(0) * 3/2)<CR>
    nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

" Enable devicons
    let g:webdevicons_enable = 1
    let g:webdevicons_enable_airline_statusline = 1

" Python Syntax
    let g:python_highlight_all = 1

" vim-go
    let g:deoplete#enable_at_startup = 1
    let g:go_highlight_structs = 1
    let g:go_highlight_methods = 1
    let g:go_highlight_functions = 1
    let g:go_highlight_operators = 1
    let g:go_highlight_build_constraints = 1
    let g:go_echo_command_info = 0
    call deoplete#custom#option('omni_patterns', { 'go': '[^. *\t]\.\w*' })

" deoplete tab completion
    inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
    inoremap <expr><s-tab> pumvisible() ? "\<c-p>" : "\<tab>"
