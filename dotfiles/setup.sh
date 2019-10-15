# Shell script to automatically download and configure dotfiles


# Move dotfiles to home directory
echo Moved bash aliases
    cp ./.bash_aliases ~/.bash_aliases
    sudo cp ./.bash_aliases ~/.bash_aliases

echo Moved bashrc
    cp ./.bashrc ~/.bashrc
    sudo cp ./.bashrc ~/.bashrc

echo Moved gitconfig
    cp ./.gitconfig ~/.gitconfig
    sudo cp ./.gitconfig ~/.gitconfig

echo Moved vimrc
    cp ./.vimrc ~/.vimrc
    sudo cp ./.vimrc ~/.vimrc

echo Moved inputrc
    cp ./.inputrc ~/.inputrc
    sudo cp ./.inputrc ~/.inputrc

echo Moved Xresources
    cp ./.Xresources ~/.Xresources

echo Moved powerline configs
    mkdir -p ~/.config/powerline-shell && cp ./config.json ~/.config/powerline-shell/config.json
    sudo mkdir -p ~/.config/powerline-shell && cp ./config.json ~/.config/powerline-shell/config.json

echo Moved mailcap
    cp ./.mailcap ~/.mailcap

echo Created Ranger Config Directory
    mkdir -p ~/.config/ranger
    sudo mkdir -p ~/.config/ranger

echo Moved commands.py
    cp ./commands.py ~/.config/ranger/commands.py
    sudo cp ./commands.py ~/.config/ranger/commands.py

echo Moved rc.conf
    cp ./rc.conf ~/.config/ranger/rc.conf
    sudo cp ./rc.conf ~/.config/ranger/rc.conf

echo Moved rifle.conf
    cp ./rifle.conf ~/.config/ranger/rifle.conf
    sudo cp ./rifle.conf ~/.config/ranger/rifle.conf

echo Moved scope.sh
    cp ./scope.sh ~/.config/ranger/scope.sh
    sudo cp ./scope.sh ~/.config/ranger/scope.sh

echo Moving Neofetch configs
    # Make neofetch directory if it doesn't exist
    mkdir -p ~/.config/neofetch
    sudo mkdir -p ~/.config/neofetch

    cp ./config.conf ~/.config/neofetch/config.conf
    sudo cp ./config.conf ~/.config/neofetch/config.conf
