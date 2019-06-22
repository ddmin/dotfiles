# Script to automatically move files from home directory to this repo

echo Copied bash aliases
    cp ~/.bash_aliases ./.bash_aliases

echo Copied bashrc
    cp ~/.bashrc ./.bashrc

echo Copied commands.py
    cp ~/.config/ranger/commands.py ./commands.py

echo Copied powerline configs
    cp ~/.config/powerline-shell/config.json ./config.json

echo Copied gitconfig
    cp ~/.gitconfig ./.gitconfig

echo Copied mailcap
    cp ~/.mailcap ./.mailcap

echo Copied rc.conf
    cp ~/.config/ranger/rc.conf ./rc.conf

echo Copied rifle.conf
    cp ~/.config/ranger/rifle.conf ./rifle.conf

echo Copied scope.sh
    cp ~/.config/ranger/scope.sh ./scope.sh

echo Copied vimrc
    cp ~/.vimrc ./.vimrc
