{ config, pkgs, ... }: {
  # Define user fkoppe
  users.users.fkoppe = {
    isNormalUser = true;
    description = "Felix Koppe";
    extraGroups = [ "networkmanager" "wheel" ];
  };
}
