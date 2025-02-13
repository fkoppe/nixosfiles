#!/usr/bin/env bash

# Get hostname from argument
HOSTNAME=$1

WALLPAPER_DIR="/home/koppe/Pictures/Wallpapers"

# Function to set wallpaper for a specific screen
set_wallpaper() {
    local screen=$1
    local wallpaper=$2
    /run/current-system/sw/bin/qdbus org.kde.plasmashell /PlasmaShell org.kde.PlasmaShell.evaluateScript "
    var desktops = desktops();
    if (desktops.length > $screen) {
      desktops[$screen].wallpaperPlugin = 'org.kde.image';
      desktops[$screen].currentConfigGroup = ['Wallpaper', 'org.kde.image', 'General'];
      desktops[$screen].writeConfig('Image', 'file://$wallpaper');
    }"
}

# Set wallpapers based on hostname
case "$HOSTNAME" in
    "r2d2xx")
        set_wallpaper 0 "$WALLPAPER_DIR/wallpaper.jpg"
        ;;

    "c3poxx")
        set_wallpaper 0 "$WALLPAPER_DIR/r2d2xx_primary.jpg"
        set_wallpaper 1 "$WALLPAPER_DIR/r2d2xx_secondary.jpg"
        ;;

    *)
        set_wallpaper 0 "$WALLPAPER_DIR/default.jpg"
        ;;
esac
