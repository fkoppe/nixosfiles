{ config, pkgs, ... }:

{
  imports = [
    ./wallpaper.nix
  ];

  home.username = "koppe";
  home.homeDirectory = "/home/koppe";

  home.packages = with pkgs; [ librewolf tidal-hifi ];

  programs.bash.enable = true;
  programs.git = {
    enable = true;
    userName = "koppe";
    userEmail = "fkoppe@web.de";
  };

  home.file = {
    ".config/dolphinrc".source = ./dotfiles/dolphinrc;
    ".config/kdeglobals".source = ./dotfiles/kdeglobals;
  };

  home.stateVersion = "24.11";

  programs.home-manager.enable = true;
}
