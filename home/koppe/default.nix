{ config, pkgs, ... }:

{
  home.username = "koppe";
  home.homeDirectory = "/home/koppe";

  home.packages = with pkgs; [
    librewolf
  ];

  programs.bash.enable = true;
  programs.git = {
    enable = true;
    userName = "koppe";
    userEmail = "fkoppe@web.de";
  };

  home.stateVersion = "24.11";
}
