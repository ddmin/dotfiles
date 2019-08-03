# Shell script to automatically download and configure dotfiles

# Download git, vim, and neofetch
    yes | sudo apt-get install git
    yes | sudo apt-get install vim
    yes | sudo apt-get install neofetch

# Move dotfiles to home directory
echo Moved bash aliases
    cp ./.bash_aliases ~/.bash_aliases

echo Moved bashrc
    cp ./.bashrc ~/.bashrc

echo Moved gitconfig
    cp ./.gitconfig ~/.gitconfig

echo Moved vimrc
    cp ./.vimrc ~/.vimrc

echo Moved inputrc
    cp ./.inputrc ~/.inputrc

echo Moved Xresources
    cp ./.Xresources ~/.Xresources

echo Moved powerline configs
    mkdir -p ~/.config/powerline-shell && cp ./config.json ~/.config/powerline-shell/config.json

echo Moved mailcap
    cp ./.mailcap ~/.mailcap

mkdir -p ~/.config/ranger

echo Moved commands.py
    cp ./commands.py ~/.config/ranger/commands.py

echo Moved rc.conf
    cp ./rc.conf ~/.config/ranger/rc.conf

echo Moved rifle.conf
    cp ./rifle.conf ~/.config/ranger/rifle.conf

echo Moved scope.sh
    cp ./scope.sh ~/.config/ranger/scope.sh

echo Moving Neofetch configs
    # Make neofetch directory if it doesn't exist
    mkdir -p ~/.config/neofetch
    cp ./config.conf ~/.config/neofetch/config.conf
