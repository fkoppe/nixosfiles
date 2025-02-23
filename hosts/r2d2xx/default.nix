{ config, pkgs, inputs, ... }: {
  imports = [
    ./disko.nix
    ./hardware-configuration.nix
    ./sddm-configuration.nix

    ../common/global
    ../common/optional/audio.nix
    ../common/optional/desktop-packages.nix
    ../common/optional/kde.nix

    ../../user/fkoppe.nix
  ];

  networking.hostName = "r2d2xx";

  system.stateVersion = "24.11";
}
