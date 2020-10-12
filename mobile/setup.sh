# setup storage
termux-setup-storage

# install packages
yes | pkg install vim
yes | pkg install git
yes | pkg install ranger

# termux-ohmyzsh install script
# https://github.com/Cabbagec/termux-ohmyzsh
sh -c "$(curl -fsSL https://github.com/Cabbagec/termux-ohmyzsh/raw/master/install.sh)"

# Install fzf
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    yes | ~/.fzf/install

# zshrc
cp ./.zshrc ~/.zshrc

# vimrc
cp ./.vimrc ~/.vimrc
