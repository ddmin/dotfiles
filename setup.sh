#!/bin/bash
# SETUP: setup dotfiles

# config directory for applications
ROOTDIR="/root"
DOTDIR="$HOME"
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
        yes | pkg install exa
        yes | pkg install ranger
        yes | pkg install golang
        yes | pkg install busybox termux-services
        yes | pkg install openssh
        yes | pkg install zsh

    echo Installing vim-plug
        curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    echo Installing ohmyzsh
        git clone https://github.com/Cabbagec/termux-ohmyzsh.git "$HOME/.termux-ohmyzsh" --depth 1

    mv "$HOME/.termux" "$HOME/.termux.bak.$(date +%Y.%m.%d-%H:%M:%S)"
    cp -R "$HOME/.termux-ohmyzsh/.termux" "$HOME/.termux"

    git clone git://github.com/robbyrussell/oh-my-zsh.git "$HOME/.oh-my-zsh" --depth 1
    mv "$HOME/.zshrc" "$HOME/.zshrc.bak.$(date +%Y.%m.%d-%H:%M:%S)"
    cp "$HOME/.oh-my-zsh/templates/zshrc.zsh-template" "$HOME/.zshrc"
    sed -i '/^ZSH_THEME/d' "$HOME/.zshrc"
    sed -i '1iZSH_THEME=robbyrussell' "$HOME/.zshrc"

    # syntax highlighting
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$HOME/.zsh-syntax-highlighting" --depth 1
    echo "source $HOME/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> "$HOME/.zshrc"

    # autosuggestions
    git clone https://github.com/zsh-users/zsh-autosuggestions.git $HOME/.zsh-autosuggestions
    echo "source $HOME/.zsh-autosuggestions/zsh-autosuggestions.zsh" >> "$HOME/.zshrc"

    sed -i '/^plugins/d' "$HOME/.zshrc"
    sed -i '1iplugins=(git vi-mode)' "$HOME/.zshrc"

    # moving dotfiles
    echo Moving zshrc
        cat "$HOME/.zshrc" "$MOBILE/zshrc" > "$DOTDIR/zshrc"
        mv "$DOTDIR/zshrc" "$DOTDIR/.zshrc"

    echo Moving vimrc
        cp "$MOBILE/vimrc" "$DOTDIR/.vimrc"

    echo Moving gitconfig
        cp "$MOBILE/gitconfig" "$DOTDIR/.gitconfig"

    # change shell
    chsh -s zsh

    echo "Choose your color scheme"
    $HOME/.termux/colors.sh

    echo "Choose your font"
    $HOME/.termux/fonts.sh

    echo "Please restart Termux app..."

    exit
}

# root setup
function root {
    echo "============== ROOT SETUP =============="
    echo "Requires root privileges:"
    sudo echo "Verified."

    echo Moving bashrc
        sudo cp "$BASIC/bashrc" "$ROOTDIR/.bashrc"

    echo Moving profile
        sudo cp "$BASIC/profile" "$ROOTDIR/.profile"

    # switch color for root prompt to red
        sudo sed -i 's/32/31/' "$ROOTDIR/.bashrc"

    echo Moving vimrc
        sudo cp "$BASIC/vimrc" "$ROOTDIR/.vimrc"

    echo DONE
}

# regular setup
function setup {
    echo "============== NORMAL SETUP =============="

    echo Moving zshrc
        cp "$NORMAL/zshrc" "$DOTDIR/.zshrc"

    echo Moving zsh aliases
        cp "$NORMAL/aliases" "$DOTDIR/.aliases"

    echo Moving profile
        cp "$NORMAL/profile" "$DOTDIR/.profile"

    echo Moving gitconfig
        cp "$NORMAL/gitconfig" "$DOTDIR/.gitconfig"

    echo "============== VIM =============="
    echo Moving vimrc
        cp "$NORMAL/vimrc" "$DOTDIR/.vimrc"

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
    echo Moving bashrc
        cp "$BASIC/bashrc" "$DOTDIR/.bashrc"

    echo Moving zshrc
        cp "$BASIC/zshrc" "$DOTDIR/.zshrc"

    echo Moving profile
        cp "$BASIC/profile" "$DOTDIR/.profile"

    echo Moving gitconfig
        cp "$BASIC/gitconfig" "$DOTDIR/.gitconfig"

    echo Moving vimrc
        cp "$BASIC/vimrc" "$DOTDIR/.vimrc"

    echo Moving Xresources
        cp "$BASIC/Xresources" "$DOTDIR/.Xresources"

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
