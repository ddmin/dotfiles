# send alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# ls aliases
alias ls='ls -F --color=auto'

# logo-ls has prettier icons
alias l='logo-ls -v'
alias la='logo-ls -Av'
alias ll='logo-ls -vlg'

# use nvim
alias vi='vim -u ~/.basic_vimrc'
alias vim='nvim'

# change wallpaper
alias chwal='wal --vte -q -i ~/Pictures/Wallpapers'

# change wallpaper to Linux Mint default wallpapers
alias norm='wal --vte -q -i /usr/share/backgrounds/linuxmint-combined'

# change wallpaper to specific image
function bkg() {
    wal --vte -q -i "$1" && neofetch
}

# set terminal tab names
function title() {
    echo -e "set title: $1\033]0;$@\007"
}

# naviage to directories with ranger
alias ranger='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
