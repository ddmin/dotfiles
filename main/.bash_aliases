# Alias fortune to clear && fortune | cowsay
alias fortune="clear && fortune | cowsay"

# Alias neofetch to clear && neofetch
alias neofetch="clear && neofetch"

# some ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# create temporary reminder list
alias todo='vim /tmp/todo'

# enable feh images in rtv
alias rtv='rtv --enable-media'

# change wallpaper
alias chwal='wal --vte -q -i ~/Pictures/Wallpapers && neofetch'

# change wallpaper (default wallpapers)
alias norm='wal --vte -q -i /usr/share/backgrounds/linuxmint-combined && neofetch'