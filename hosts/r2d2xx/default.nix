{ config, pkgs, ... }:

{
  imports = [
    inputs.hardware.nixosModules.common-cpu-amd
    inputs.hardware.nixosModules.common-gpu-nvidia
    inputs.hardware.nixosModules.common-pc-ssd

    ./hardware-configuration.nix
    ./grafics-configuration.nix

    ../common/optional/desktop/kde.nix
    ../common/optional/bluetooth.nix

    ../../modules/global

    ../../users/koppe.nix
  ];

  networking.hostName = "r2d2xx";

  powerManagement.powertop.enable = true;

  # Lid settings
  services.logind = {
    lidSwitch = "suspend";
    lidSwitchExternalPower = "lock";
  };

  hardware.graphics.enable = true;

  # Home Manager setup for user 'koppe'
  home-manager.users.koppe = import ../../home/koppe/default.nix;
}
