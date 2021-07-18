# COPYLOCAL: automatically move dotfiles from ~/ to this repository

DOTDIR="./dotfiles"

echo "============== DOTFILES =============="
echo Copying zsh aliases
    cp ~/.aliases "$DOTDIR/aliases"

echo Copying zshrc
    cp ~/.zshrc "$DOTDIR/zshrc"

echo Copying profile
    cp ~/.profile "$DOTDIR/profile"

echo Copying gitconfig
    cp ~/.gitconfig "$DOTDIR/gitconfig"

echo Copying vimrc
    cp ~/.vimrc "$DOTDIR/vimrc"

echo Copying .Xresources
    cp ~/.Xresources "$DOTDIR/Xresources"

echo Copying init.vim
    cp ~/.config/nvim/init.vim "$DOTDIR/init.vim"

echo DONE

# copy scripts from ~/Code/Bash
SCRIPTDIR="./scripts"

echo "============== SCRIPTS =============="
echo "Copying scripts from ~/Code/Bash."
cp -a ~/Code/Bash/* "$SCRIPTDIR/."
echo DONE
