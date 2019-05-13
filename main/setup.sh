# Move dotfiles to home directory

sudo apt-get -y install git
sudo apt-get -y install vim
sudo apt-get -y install neofetch

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
