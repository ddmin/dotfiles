# send alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# some ls aliases
alias ls='ls -F --color=auto'
alias l='logo-ls -X'
alias ll='logo-ls -lghX'
alias la='logo-ls -AX'
alias lla='logo-ls -lgAhX'
alias lt='logo-ls -RX'

# Extract archived files
extract () {
   if [ -f $1 ] ; then
       case $1 in
           *.tar.bz2)   tar xvjf $1;;
           *.tar.gz)    tar xvzf $1;;
           *.bz2)       bunzip2 $1 ;;
           *.rar)       unrar x $1 ;;
           *.gz)        gunzip $1  ;;
           *.tar)       tar xvf $1 ;;
           *.tbz2)      tar xvjf $1;;
           *.tgz)       tar xvzf $1;;
           *.zip)       unzip $1   ;;
           *.Z)         uncompress $1  ;;
           *.7z)        7z x $1;;
           *) echo "don't know how to extract '$1'..." ;;
       esac
   else
       echo "'$1' is not a valid file!"
   fi
}

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

# Mono Audio
alias mix=' pacmd load-module module-remap-sink sink_name=mono master=alsa_output.pci-0000_00_1f.3.analog-stereo channels=1 channel_map=mono'

# fix sound
alias sound='sudo alsa force-reload'

# add camera
alias cam='VBoxManage controlvm "Windows 10" webcam attach .1'

# shotcut
alias shotcut='shotcut & exit'

# webcamoid
alias webcamoid='webcamoid & exit'

# vpn
alias vpns='protonvpn s'
alias vpnc='sudo protonvpn c'
alias vpnd='sudo protonvpn d'
