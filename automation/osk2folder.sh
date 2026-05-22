#!/bin/bash

# Just execute the command, nothing else.
# Best Use Case: Finding osu! skin files

# USage: ./osk2folder.sh

# Check if there are any osu! skin files
find $HOME/Downloads -type f -name "*.osk"

for file in $HOME/Downloads/*.osk
do
    [ -f "$file" ] && echo "Processing osu! skin file: $file"

    # If the osu! beatmap directory does not exist
    if [ ! -d "$HOME/osu!/Skins" ]; then
        if [ ! -d "$HOME/osu!" ]; then
            mkdir "$HOME/osu!"
        fi

        mkdir $HOME/osu!/Skins
    elif [ -d "$HOME/osu!/Skins" ]; then
        # Do nothing
        echo "osu! skins directory exists"
    fi

    filename=$(basename "$file" .osk)

    # Extract the files to the folder
    unzip "$file" -d "$HOME/osu!/Skins/$filename"

    rm "$file"
done