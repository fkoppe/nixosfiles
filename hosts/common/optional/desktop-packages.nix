{ config, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    #Browser
    firefox
    librewolf

    # Editor
    vscodium

    # Password
    keepassxc

    #TODO
    epson-escpr2

    #TODO
    jetbrains.idea-community-bin
  ];
}
