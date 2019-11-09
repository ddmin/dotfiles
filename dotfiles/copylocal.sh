# Script to automatically move files from home directory to this repo

echo Copying bash aliases
    cp ~/.bash_aliases ./.bash_aliases

echo Copying bashrc
    cp ~/.bashrc ./.bashrc

echo Copying commands.py
    cp ~/.config/ranger/commands.py ./commands.py

echo Copying powerline configs
    cp ~/.config/powerline-shell/config.json ./config.json

echo Copying gitconfig
    cp ~/.gitconfig ./.gitconfig

echo Copying mailcap
    cp ~/.mailcap ./.mailcap

echo Copying rc.conf
    cp ~/.config/ranger/rc.conf ./rc.conf

echo Copying rifle.conf
    cp ~/.config/ranger/rifle.conf ./rifle.conf

echo Copying scope.sh
    cp ~/.config/ranger/scope.sh ./scope.sh

echo Copying vimrc
    cp ~/.vimrc ./.vimrc

echo Copying .Xresources
    cp ~/.Xresources ./.Xresources

echo Copying init.vim
    cp ~/.config/nvim/init.vim ./init.vim

echo Copying neofetch
    cp ~/.config/neofetch/config.conf ./config.conf

echo Finished
