{ config, pkgs, vscode-extensions, ... }: {
  home.username = "fkoppe";
  home.homeDirectory = "/home/fkoppe";

  home.packages = with pkgs; [ tidal-hifi ];

  # Git
  programs.git = {
    enable = true;
    userName = "fkoppe";
    userEmail = "fkoppe@web.de";
  };

  home.stateVersion = "24.11";

  programs.home-manager.enable = true;
}
