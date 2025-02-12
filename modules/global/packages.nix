{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Monitor
    sysstat
    lm_sensors
    pciutils

    # CLI
    lsd
    bat
    neofetch
    wget
    mc

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
    nvtopPackages.nvidia
    nvtopPackages.amd

    # Format
    nixfmt
  ];
}
