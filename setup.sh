# SETUP: setup dotfiles

# config directory for applications
ROOTDIR="/root"
DOTDIR="$HOME"
RANGERDIR="$HOME/.config/ranger"
NEODIR="$HOME/.config/neofetch"
VIMDIR="$HOME/.vim"
NVIMDIR="$HOME/.config/nvim"

BASIC="./basic"
NORMAL="./dotfiles"
MOBILE="./mobile"

# mobile setup
function mobile {
    echo "============== MOBILE SETUP =============="

    termux-setup-storage

    echo Installing packages...
        yes | pkg install vim
        yes | pkg install git
        yes | pkg install ranger
        yes | pkg install golang

    echo Installing ohmyzsh
        sh -c "$(curl -fsSL https://github.com/Cabbagec/termux-ohmyzsh/raw/master/install.sh)"

    echo Moving zshrc
        cp "$MOBILE/zshrc" "$DOTDIR/.zshrc"

    echo Moving vimrc
        cp "$MOBILE/vimrc" "$DOTDIR/.vimrc"

    echo Moving gitconfig
        cp "$MOBILE/gitconfig" "$DOTDIR/.gitconfig"
}

# root setup
function root {
    echo "============== ROOT SETUP =============="
    echo "Requires root privileges:"
    sudo echo "Verified."
    echo Moving bash aliases
        sudo cp "$BASIC/basic_alias" "$ROOTDIR/.bash_aliases"

    echo Moving bashrc
        sudo cp "$BASIC/basic_bashrc" "$ROOTDIR/.bashrc"

    echo Moving vimrc
        sudo cp "$BASIC/basic_vimrc" "$ROOTDIR/.vimrc"

    echo DONE
}

# regular setup
function setup {
    echo "============== NORMAL SETUP =============="

    echo Moving bash aliases
        cp "$NORMAL/.bash_aliases" "$DOTDIR/.bash_aliases"

    echo Moving bashrc
        cp "$NORMAL/.bashrc" "$DOTDIR/.bashrc"

    echo Moving profile
        cp "$NORMAL/.profile" "$DOTDIR/.profile"

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

    echo Moving feh keys
        cp "$NORMAL/keys" "$DOTDIR/.config/feh/keys"

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

    echo Moving profile
        cp "$BASIC/basic_profile" "$DOTDIR/.profile"

    echo Moving gitconfig
        cp "$BASIC/gitconfig" "$DOTDIR/.gitconfig"

    echo Moving vimrc
        cp "$BASIC/basic_vimrc" "$DOTDIR/.vimrc"

    echo DONE
}

printf "1. Basic Setup\n"
printf "2. Normal Setup\n"
printf "3. Mobile Setup\n"
printf "4. Root Setup\n"
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
    mobile
    exit
elif [ $mode == "4" ]
then
    root
    exit
else
    echo "Invalid Option: '$mode'"
    exit
fi
