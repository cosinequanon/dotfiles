#!/bin/bash

# copy the dotfiles in this directory
# to the home directory

echo "Copying files to home directory"
echo

for full_file in $(find $(pwd) -type f -name ".*"); do
    file_name=$(echo $full_file | awk -F "/" '{print $NF}')
    echo "Copying $full_file to ~/$file_name"
    rm -f ~/$file_name
    cp $full_file ~/$file_name 
done

echo
echo "Finished symlinks"
exit 0
