set runtimepath+=~/.vim,~/.vim/after
set packpath+=~/.vim
source ~/.vimrc

lua <<EOF

    require'nvim-treesitter.configs'.setup {

      ensure_installed = {
        'bash', 'go', 'html', 'javascript', 'python', 'rust'
      },

      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },

      indent = {
        enable = true
      }
    }

EOF
