# some ls aliases
alias ls='ls -F --color=auto'
alias l='lsd --group-dirs first -F'
alias ll='lsd --group-dirs first -lF'
alias la='lsd --group-dirs first -aF'
alias lla='lsd --group-dirs first -alF'
alias lt='lsd --tree'

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

# enable feh images in rtv
alias rtv='rtv --enable-media'

# change wallpaper
alias chwal='wal --vte -q -i ~/Pictures/Wallpapers && neofetch'

# change wallpaper to Linux Mint default wallpapers
alias norm='wal --vte -q -i /usr/share/backgrounds/linuxmint-combined && neofetch'

# try to keep colorscheme after opening file in ranger
alias ranger='ranger && wal --vte -q -R'

# open vimtutor with my vim settings
alias vimtutor='cp ~/Documents/vimtutor /tmp/vimtutor && vim /tmp/vimtutor'
