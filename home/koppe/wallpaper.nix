{ config, pkgs, lib, ... }:

{
  # Session activation script to set wallpapers at login
  home.activation.setWallpaper = lib.hm.dag.entryAfter [ "graphical-session" ] ''

    ${builtins.toPath ./wallpaper.sh} "$HOSTNAME"
  '';
}
