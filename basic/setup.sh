# shell script to automatically move dotfiles

# moving dotfiles to home directory
echo Moving bash aliases
    cp ./basic_aliases ~/.bash_aliases

echo Moving bashrc
    cp ./basic_bashrc ~/.bashrc

echo Moving gitconfig
    cp ./gitconfig ~/.gitconfig

echo Moving vimrc
    cp ./basic_vimrc ~/.vimrc

echo Finished
echo ""
