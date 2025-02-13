{ config, pkgs, ... }:

{
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
    vim
    vscodium

    # Top
    htop
    btop
    atop
    iotop
    iftop
    nvtopPackages.nvidia
    nvtopPackages.amd

    # Format
    nixfmt-classic

    # Homemanager
    home-manager
  ];
}
