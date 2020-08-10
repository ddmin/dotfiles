# Shell script to automatically download and configure the basic dotfiles

sudo echo ""

# Move dotfiles to home directory
echo Moving bashrc
    cp ./basic_bashrc ~/.bashrc
    sudo cp ./basic_bashrc /root/.bashrc

echo Moving vimrc
    cp ./basic_vimrc ~/.vimrc
    sudo cp ./basic_vimrc /root/.vimrc

echo Finished
