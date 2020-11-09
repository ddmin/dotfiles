# SETUP: setup dotfiles

# config directory for applications
DOTDIR="$HOME"
RANGERDIR="$HOME/.config/ranger"
NEODIR="$HOME/.config/ranger"
VIMDIR="$HOME/.vim"

BASIC="./basic"

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
    echo "TWO"
elif [ $mode == "3" ]
then
    echo "THREE"
else
    echo "Invalid Option: '$mode'"
    exit
fi
exit

# basic setup
function basic {
    echo "============== BASIC SETUP =============="
    echo Moving bash aliases
        cp "$BASIC/basic_aliases" "$DOTDIR/.bash_aliases"

    echo Moving bashrc
        cp "$BASIC/basic_bashrc" "$DOTDIR/.bashrc"

    echo Moving gitconfig
        cp "$BASIC/gitconfig" "$DOTDIR/.gitconfig"

    echo Moving vimrc
        cp "$BASIC/basic_vimrc" "$DOTDIR/.vimrc"

    echo DONE
}

# basic/setup
# shell script to automatically move dotfiles

# moving dotfiles to home directory
echo Moving bash aliases
    cp ./basic_aliases ~/.bash_aliases

echo Moving bashrc
    cp ./basic_bashrc ~/.bashrc

echo Moving gitconfig
    cp ./gitconfig ~/.gitconfig

echo Moving vimrc
    cp ./basic_vimrc ~/.vimrc

echo Finished
echo ""

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

#dotfiles
# Shell script to automatically download and configure dotfiles

sudo echo ""

# Move dotfiles to home directory
echo Moving bash aliases
    cp ./.bash_aliases ~/.bash_aliases
    sudo cp ./.bash_aliases /root/.bash_aliases

echo Moving bashrc
    cp ./.bashrc ~/.bashrc
    sudo cp ./.bashrc /root/.bashrc

echo Moving gitconfig
    cp ./.gitconfig ~/.gitconfig
    sudo cp ./.gitconfig /root/.gitconfig

echo Moving vimrc
    cp ./.vimrc ~/.vimrc
    sudo cp ./.vimrc /root/.vimrc

echo Moving basic_vimrc
    cp ../basic/basic_vimrc ~/.basic_vimrc

echo Moving init.vim
    mkdir -p ~/.config/nvim && cp ./init.vim ~/.config/nvim/init.vim
    sudo mkdir -p /root/.config/nvim && sudo cp ./init.vim /root/.config/nvim/init.vim

echo Moving inputrc
    cp ./.inputrc ~/.inputrc
    sudo cp ./.inputrc /root/.inputrc

echo Moving Xresources
    cp ./.Xresources ~/.Xresources

echo Moving powerline configs
    mkdir -p ~/.config/powerline-shell && cp ./config.json ~/.config/powerline-shell/config.json
    sudo mkdir -p /root/.config/powerline-shell && sudo cp ./config.json /root/.config/powerline-shell/config.json

echo Moving mailcap
    cp ./.mailcap ~/.mailcap

echo Creating Ranger Config Directory
    mkdir -p ~/.config/ranger
    sudo mkdir -p /root/.config/ranger

echo Moving commands.py
    cp ./commands.py ~/.config/ranger/commands.py
    sudo cp ./commands.py /root/.config/ranger/commands.py

echo Moving rc.conf
    cp ./rc.conf ~/.config/ranger/rc.conf
    sudo cp ./rc.conf /root/.config/ranger/rc.conf

echo Moving rifle.conf
    cp ./rifle.conf ~/.config/ranger/rifle.conf
    sudo cp ./rifle.conf /root/.config/ranger/rifle.conf

echo Moving scope.sh
    cp ./scope.sh ~/.config/ranger/scope.sh
    sudo cp ./scope.sh /root/.config/ranger/scope.sh

echo Moving Neofetch configs
    # Make neofetch directory if it doesn't exist
    mkdir -p ~/.config/neofetch
    sudo mkdir -p /root/.config/neofetch

    cp ./config.conf ~/.config/neofetch/config.conf
    sudo cp ./config.conf /root/.config/neofetch/config.conf

echo Creating vim undo directory
    mkdir -p ~/.vim/undodir
    sudo mkdir -p ~/.vim/undodir

echo Finished

echo ""
