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
