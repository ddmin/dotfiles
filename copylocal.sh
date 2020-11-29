# COPYLOCAL: automatically move dotfiles from ~/ to this repository

DOTDIR="./dotfiles"

echo "============== DOTFILES =============="
echo Copying bash aliases
    cp ~/.bash_aliases "$DOTDIR/.bash_aliases"

echo Copying bashrc
    cp ~/.bashrc "$DOTDIR/.bashrc"

echo Copying commands.py
    cp ~/.config/ranger/commands.py "$DOTDIR/commands.py"

echo Copying powerline configs
    cp ~/.config/powerline-shell/config.json "$DOTDIR/config.json"

echo Copying gitconfig
    cp ~/.gitconfig "$DOTDIR/.gitconfig"

echo Copying mailcap
    cp ~/.mailcap "$DOTDIR/.mailcap"

echo Copying rc.conf
    cp ~/.config/ranger/rc.conf "$DOTDIR/rc.conf"

echo Copying rifle.conf
    cp ~/.config/ranger/rifle.conf "$DOTDIR/rifle.conf"

echo Copying scope.sh
    cp ~/.config/ranger/scope.sh "$DOTDIR/scope.sh"

echo Copying vimrc
    cp ~/.vimrc "$DOTDIR/.vimrc"

echo Copying .Xresources
    cp ~/.Xresources "$DOTDIR/.Xresources"

echo Copying init.vim
    cp ~/.config/nvim/init.vim "$DOTDIR/init.vim"

echo Copying neofetch
    cp ~/.config/neofetch/config.conf "$DOTDIR/config.conf"

echo Copying feh keys
    cp ~/.config/feh/keys "$DOTDIR/keys"

echo DONE

# copy scripts from ~/Code/Bash
SCRIPTDIR="./scripts"

echo "============== SCRIPTS =============="
echo "Copying scripts from ~/Code/Bash."
cp -a ~/Code/Bash/* "$SCRIPTDIR/."
echo DONE

# set up records of files
RECORDDIR="./record"
echo "============== RECORDS =============="
echo "Creating Records."
# change delimiter
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

# create records of these directories
dirs=("Downloads/ISO" "Downloads/ROM" "VirtualBox VMs" "Videos")
save_file="$RECORDDIR/record.txt"

# clear record file
> $save_file

# loop through directories
for d in ${dirs[@]}; do
    echo "Recording $d"

    echo $HOME/$d >> $save_file
    ls $HOME/$d >> $save_file
    echo "" >> $save_file
done

echo Copying python3 requirements
    pip3 freeze > "$RECORDDIR/python-requirements.txt"
    sed -i s/=.*// "$RECORDDIR/python-requirements.txt"

echo DONE

# change back
IFS=$SAVEIFS
