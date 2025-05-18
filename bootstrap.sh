#!/usr/bin/bash

DOT_DIR='~/dotfies'
SCRIPT_DIR=$(pwd)
UNAME=$(uname | tr '[:upper:]' '[:lower:]')

# So that this script can see all of the .bash files
shopt -s dotglob

do_thing() {
 local dir=$1
 local action_type=$(basename $dir)

 case $action_type in
    config)
    output_dir='.config'
    echo "Sending everything in $dir to $output_dir"
    for source_file in $dir/*; do
        name=$(basename $source_file)
        target="$HOME/$output_dir/$name"

        # Link already exists
        if [ -e $target ]; then
        echo "Link for $name already found in $output_dir."
        continue;
        fi

        echo "$source_file"
        ln -s $source_file $target
    done
    ;;

    copy)
    target="$HOME"
    echo "Copying everything in $dir to $target"
    ;;

    link)
    target="$HOME"
    echo "Linking everything in $dir to home"
    ;;

    *)
    echo "Ignoring $dir"
    ;;

 esac
}

# Process everything in dotfiles
for d in $SCRIPT_DIR/*; do
    if [ -d $d ]; then
        do_thing $d
    fi
done

# rsync -var \
#     --exclude='README.md'\
#     --exclude='.git/'\
#     --exclude='init/'\
