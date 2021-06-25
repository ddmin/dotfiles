# | |__   __ _ ___| |__  _ __ ___
# | '_ \ / _` / __| '_ \| '__/ __|
# | |_) | (_| \__ \ | | | | | (__
# |_.__/ \__,_|___/_| |_|_|  \___|

# bash aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# profile
if [ -f ~/.profile ]; then
    . ~/.profile
fi

# Start neofetch
neofetch

# Start powerline-shell

function _update_ps1() {
    PS1="$($GOPATH/bin/powerline-go -cwd-max-depth 1 -error $? -jobs $(jobs -p | wc -l))"
}

if [ "$TERM" != "linux" ] && [ -f "$GOPATH/bin/powerline-go" ]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

# enable vi mode
set -o vi

# change jk to esc in vi mode
bind '"jk":vi-movement-mode'

# Set default editor
export EDITOR='nvim'
export VISUAL='nvim'

# vim man pages
export MANPAGER="/bin/sh -c \"col -b | /usr/bin/vim -u ~/.basic_vimrc --not-a-term -c 'set ft=man ts=8 nomod nolist noma' -\""

# Enable fzf search
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Remap CTRL-T to CTRL-G for fzf
bind -x '"\C-g": fzf-file-widget'
bind '"\C-t": transpose-chars'

# set colorscheme to current wallpaper
# wal --vte -q -R

# node
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
