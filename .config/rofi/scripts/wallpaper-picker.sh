#!/bin/bash

WALLPAPER_DIR="$HOME/Images/Wallpapers"

choice=$(ls "$WALLPAPER_DIR" | rofi -dmenu -i -p "󰸉 Wallpapers")

if [ -n "$choice" ]; then
    awww img "$WALLPAPER_DIR/$choice" --transition-type grow --transition-pos 0.5,0.5
fi
