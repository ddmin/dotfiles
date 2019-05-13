# Move dotfiles to home directory

sudo apt-get -y install git
sudo apt-get -y install vim

echo Copied bash aliases
cp ./.bash_aliases ~/.bash_aliases

echo Copied bashrc
cp ./.bashrc ~/.bashrc

echo Copied gitconfig
cp ./.gitconfig ~/.gitconfig

echo Copied vimrc
cp ./.vimrc ~/.vimrc
