#!/bin/bash

# Just execute the command, nothing else.
# Best Use Case: Finding osu! beatmap files

# USage: ./osz2folder.sh

# Check if there are any osu! beatmap files
find $HOME/Downloads -type f -name "*.osz"

for file in $HOME/Downloads/*.osz
do
    [ -f "$file" ] && echo "Processing osu! beatmap file: $file"

    # If the osu! beatmap directory does not exist
    if [ ! -d "$HOME/osu!/Songs" ]; then
        if [ ! -d "$HOME/osu!" ]; then
            mkdir "$HOME/osu!"
        fi

        mkdir $HOME/osu!/Songs
    elif [ -d "$HOME/osu!/Songs" ]; then
        # Do nothing
        echo "osu! songs directory exists"
    fi

    filename=$(basename "$file" .osz)

    # Extract the files to the folder
    unzip "$file" -d "$HOME/osu!/Songs/$filename"

    rm "$file"
done