# Download git, vim, and neofetch
yes | sudo apt-get install git
yes | sudo apt-get install vim
yes | sudo apt-get install neofetch

# Move dotfiles to home directory
echo Copied bash aliases
cp ./.bash_aliases ~/.bash_aliases

echo Copied bashrc
cp ./.bashrc ~/.bashrc

echo Copied gitconfig
cp ./.gitconfig ~/.gitconfig

echo Copied vimrc
cp ./.vimrc ~/.vimrc

echo Copied powerline configs
mkdir -p ~/.config/powerline && cp ./config.json ~/.config/powerline/config.json
