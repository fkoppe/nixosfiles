{ config, pkgs, ... }: {
  # Define user fkoppe
  users.users.fkoppe = {
    isNormalUser = true;
    description = "Felix Koppe";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  # Home Manager setup for user 'fkoppe'
  home-manager.users.fkoppe = import ../home/fkoppe/default.nix;
}
