#!/bin/bash

# copy the dotfiles in this directory
# to the home directory

echo "Copying files to home directory"
echo

# see http://stackoverflow.com/questions/59895
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd ${script_dir}

for full_file in $(find ${script_dir} -type f -name ".*"); do
    file_name=$(echo $full_file | awk -F "/" '{print $NF}')
    echo "Copying $full_file to ~/$file_name"
    rm -f ~/${file_name}
    cp ${full_file} ~/${file_name}
done

cd - > /dev/null

echo
echo "Finished copying"
exit 0
