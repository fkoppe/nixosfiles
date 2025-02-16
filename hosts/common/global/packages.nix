{ config, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    # Util
    sysstat
    lm_sensors
    pciutils
    inetutils

    # CLI
    lsd
    bat
    neofetch
    wget
    mc

    # ZIP
    zip
    unzip
    p7zip

    # Devel
    git
    cmake

    # Editor
    nano
    vim

    # Top
    htop
    btop
    atop
    iotop
    iftop

    # Format
    nixfmt-classic

    # Homemanager
    home-manager
  ];
}
