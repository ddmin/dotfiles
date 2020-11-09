# SETUP: setup dotfiles

# config directory for applications
DOTDIR="$HOME"
RANGERDIR="$HOME/.config/ranger"
POWERDIR="$HOME/.config/powerline-shell"
NEODIR="$HOME/.config/neofetch"
VIMDIR="$HOME/.vim"
NVIMDIR="$HOME/.config/nvim"

BASIC="./basic"
NORMAL="./dotfiles"

# regular setup

function setup {
    echo "============== NORMAL SETUP =============="

    # Move dotfiles to home directory
    echo Moving bash aliases
        cp "$NORMAL/.bash_aliases" "$DOTDIR/.bash_aliases"

    echo Moving bashrc
        cp "$NORMAL/.bashrc" "$DOTDIR/.bashrc"

    echo Moving gitconfig
        cp "$NORMAL/.gitconfig" "$DOTDIR/.gitconfig"

    echo Moving vimrc
        cp "$NORMAL/.vimrc" "$DOTDIR/.vimrc"

    echo Moving basic_vimrc
        cp "$BASIC/basic_vimrc" "$DOTDIR/.basic_vimrc"

    echo Moving Xresources
        cp "$NORMAL/.Xresources" "$DOTDIR/.Xresources"

    echo Moving inputrc
        cp "$NORMAL/.inputrc" "$DOTDIR/.inputrc"

    echo Moving mailcap
        cp "$NORMAL/.mailcap" "$DOTDIR/.mailcap"

    echo "============== POWERLINE =============="
    echo Moving config.json
        mkdir -p "$POWERDIR"
        cp "$NORMAL/config.json" "$POWERDIR/config.json"

    echo "============== RANGER =============="
        mkdir -p "$RANGERDIR"

    echo Moving commands.py
        cp "$NORMAL/commands.py" "$RANGERDIR/commands.py"

    echo Moving rc.conf
        cp "$NORMAL/rc.conf" "$RANGERDIR/rc.conf"

    echo Moving rifle.conf
        cp "$NORMAL/rifle.conf" "$RANGERDIR/rifle.conf"

    echo Moving scope.sh
        cp "$NORMAL/scope.sh" "$RANGERDIR/scope.sh"

    echo "============== NEOFETCH =============="
    echo Moving config.conf
        mkdir -p "$NEODIR"
        cp "$NORMAL/config.conf" "$NEODIR/config.conf"

    echo "============== VIM =============="
    echo Creating undodir
        mkdir -p "$VIMDIR/undodir"

    echo Moving init.vim
        mkdir -p "$NVIMDIR"
        cp "$NORMAL/init.vim" "$NVIMDIR/init.vim"

    echo DONE
}

# basic setup
function basic {
    echo "============== BASIC SETUP =============="
    echo Moving bash aliases
        cp "$BASIC/basic_alias" "$DOTDIR/.bash_aliases"

    echo Moving bashrc
        cp "$BASIC/basic_bashrc" "$DOTDIR/.bashrc"

    echo Moving gitconfig
        cp "$BASIC/gitconfig" "$DOTDIR/.gitconfig"

    echo Moving vimrc
        cp "$BASIC/basic_vimrc" "$DOTDIR/.vimrc"

    echo DONE
}

# get user input
printf "1. Basic Setup\n"
printf "2. Normal Setup\n"
printf "3. Mobile Setup\n"
printf "> "

read mode

if [ $mode == "1" ]
then
    basic
    exit
elif [ $mode == "2" ]
then
    setup
    exit
elif [ $mode == "3" ]
then
    echo "THREE"
else
    echo "Invalid Option: '$mode'"
    exit
fi

exit

# mobile
# setup storage
termux-setup-storage

# install packages
yes | pkg install vim
yes | pkg install git
yes | pkg install ranger
yes | pkg install golang

# termux-ohmyzsh install script
# https://github.com/Cabbagec/termux-ohmyzsh
sh -c "$(curl -fsSL https://github.com/Cabbagec/termux-ohmyzsh/raw/master/install.sh)"

# zshrc
cp ./.zshrc ~/.zshrc

# .vimrc
cp ./.vimrc ~/.vimrc

# gitconfig
cp ./.gitconfig ~/.gitconfig
