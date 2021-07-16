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

" vim-javascript
    Plug 'pangloss/vim-javascript'

" vim-go
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'for': 'go'}

" NERD Tree
    Plug 'preservim/nerdtree'

" YCM
    Plug 'Valloric/YouCompleteMe', { 'do': './install.py --go-completer --rust-completer --ts-completer', 'for': ['go', 'python', 'rust', 'html', 'javascript'] }

" unicode.vim
    Plug 'chrisbra/unicode.vim'

" undotree
    Plug 'mbbill/undotree'

" autoclose
    Plug 'Townk/vim-autoclose'

" vim-lion
    Plug 'tommcdo/vim-lion'

" vim-surround
    Plug 'tpope/vim-surround'

" vim-rooter
    Plug 'airblade/vim-rooter'

" NERD commenter
    Plug 'preservim/nerdcommenter'

" fzf
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'

" CSS color
    Plug 'ap/vim-css-color'

" vim-airline
 	Plug 'vim-airline/vim-airline'

" vim-airline-themes
    Plug 'vim-airline/vim-airline-themes'

" one dark
    Plug 'joshdick/onedark.vim'

" vim-devicons
    Plug 'ryanoasis/vim-devicons'

call plug#end()

" }}}

" Basics {{{

    filetype plugin on

    set nocompatible
    set encoding=utf-8
    set showcmd

    syntax on
    set wrap
    set redrawtime=10000
    set lazyredraw
    set nolist

    set number
    set relativenumber

    set ic
    inoremap jk <ESC>
    vnoremap jk <ESC>
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

" toggle numbers
    nmap <silent> <leader>n :set invnumber<CR>:set invrelativenumber<CR>

" toggle spell
    nnoremap <silent> <leader>s :set invspell spelllang=en_us<cr>

"Disable auto-commenting
    autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Remove trailing white space on save
    autocmd BufWritePre * %s/\s\+$//e

" Highlight searches and <Leader><Leader> to unhighlight
    set incsearch
    set hlsearch
    nnoremap <silent> <leader><leader> :nohl<CR><C-l>

" }}}

" Window Splits {{{

" Fix splits
    set splitbelow splitright

" Vertical Split
    nnoremap <silent> <leader>wv :vnew<CR>

" Horizontal Split
    nnoremap <silent> <leader>wh :new<CR>

" Move windows
    noremap <leader>h <C-w>h
    map <leader>j <C-w>j
    map <leader>k <C-w>k
    map <leader>l <C-w>l

" resize windows
    nmap <silent> <S-left> :vertical resize -5<CR>
    nmap <silent> <S-right> :vertical resize +5<CR>
    nmap <silent> <S-up> :resize -5<CR>
    nmap <silent> <S-down> :resize +5<CR>

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
    hi Comment ctermfg=magenta
    hi LineNr ctermfg=lightblue
    hi CursorLineNr ctermfg=darkmagenta
    hi Folded ctermbg=magenta

" }}}

" Markdown {{{

    autocmd BufWritePost /home/*/*.note silent !note2pdf %:p

" }}}

" Plugins Settings {{{

    let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp' } }

    let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'
    let $FZF_DEFAULT_COMMAND="rg --files --hidden"

    let g:fzf_colors =
    \ { 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'border':  ['fg', 'Ignore'],
      \ 'prompt':  ['bg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment'] }

" NERD Tree
    map <Leader>. :NERDTreeToggle<CR>

" fzf
    map <C-g> :Files<CR>
    map <C-f> :Rg<CR>

" YCM
    nnoremap <silent> gd :YcmCompleter GoTo<CR>

" Vim-Go
    autocmd FileType go nnoremap <Leader>r :GoRename<CR>
    autocmd FileType go nnoremap <silent> <C-b> :GoRun<CR>
    autocmd FileType go nnoremap <silent> <Leader>d :GoDoc<CR>

" vim-lion
    let g:lion_squeeze_spaces = 1

" Unicode Symbols
    imap <C-c> <Plug>(UnicodeFuzzy)
    nmap <C-c> i<Plug>(UnicodeFuzzy)

" undotree
    nnoremap <silent> <leader>z :UndotreeToggle<CR>

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
