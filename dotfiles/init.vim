set runtimepath+=~/.vim,~/.vim/after
set packpath+=~/.vim
source ~/.vimrc

lua <<EOF

    -- Treesitter --
    require'nvim-treesitter.configs'.setup {

      ensure_installed = {
        'bash', 'c', 'cpp', 'go', 'html', 'javascript', 'python', 'rust'
      },

      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },

      indent = {
        enable = true
      }
    }

    -- Autopairs --
    require('nvim-autopairs').setup{}

EOF
