#!/usr/bin/env bash

file=$(zenity --file-selection --filename $HOME/.wallpapers/)
if [[ $file == "" ]]; then
    exit 0
fi

~/.config/eww/scripts/material.py --image "$file"