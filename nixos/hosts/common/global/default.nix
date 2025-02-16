{ config, pkgs, ... }: {
  imports = [
    ./locale.nix
    ./packages.nix
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Configure console keymap
  console.keyMap = "de";

  #TODO
  services.printing = { enable = true; drivers = [ pkgs.epson-escpr ]; };

  services.avahi = { enable = true; nssmdns4 = true; };

  # Enable networking
  networking.networkmanager.enable = true;

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
}
