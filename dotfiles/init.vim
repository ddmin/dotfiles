set runtimepath+=~/.vim,~/.vim/after
set packpath+=~/.vim
source ~/.vimrc

lua <<EOF

    require'nvim-treesitter.configs'.setup {
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
    }

    require'nvim-treesitter.configs'.setup {
      indent = {
        enable = true
      }
    }

EOF
