{ config, pkgs, lib, ... }:

let
  sddmBackground = "wallpapers/4k/forest_dark.jpg";
  sddmModule = import ../../modules/wallpaper/sddm-background.nix { inherit config lib pkgs sddmBackground; };
in
{
  imports = [ sddmModule ];
}
