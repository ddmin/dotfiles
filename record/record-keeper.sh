#!/bin/bash
# set up records of files

echo "Creating Records."

# change delimiter
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

# create records of these directories
dirs=("Downloads/ISO" "Downloads/ROM" "VirtualBox VMs")
save_file="record.txt"

# clear record file
> $save_file

# loop through directories
for d in ${dirs[@]}; do
    echo $d

    echo $HOME/$d >> $save_file
    ls $HOME/$d >> $save_file
    echo "" >> $save_file
done

echo "Done."

# change back
IFS=$SAVEIFS
