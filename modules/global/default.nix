{ config, pkgs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable important Nix features
  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    auto-optimise-store = true;  # Optimize Nix store to save space
    trusted-users = [ "root" "koppe" ];  # Allow user koppe to run nix commands
  };

  # Garbage collection to keep the system clean
  nix.gc = {
    automatic = true;
    dates = "weekly";  # Run GC weekly
    options = "--delete-older-than 30d";
  };

  services.openssh.enable = true;

  # Bootloader
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot/efi";
    };

    systemd-boot.enable = true;
  };

  system.stateVersion = "24.11";
}
