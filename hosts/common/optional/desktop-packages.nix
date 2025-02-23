{ config, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    #Browser
    firefox
    librewolf

    # Password
    keepassxc

    # Telegram
    _64gram

    #TODO
    epson-escpr2

    #TODO
    jetbrains.idea-community-bin

    #TODO
    qtcreator
  ];
}
