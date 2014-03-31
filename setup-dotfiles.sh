#!/bin/bash

# symlink the dotfiles in this directory
# to the home directory

echo "Symlinking files to home directory"
echo

for full_file in $(find $(pwd) -type f -name ".*"); do
    file_name=$(echo $full_file | awk -F "/" '{print $NF}')
    echo "Symlinking $full_file to ~/$file_name"
    rm ~/$file_name
    ln -s $full_file ~/$file_name 
done

echo
echo "Finished symlinks"
exit 0
