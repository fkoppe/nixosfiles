{ config, pkgs, inputs, ... }: {
  # Define user fkoppe
  users.users.fkoppe = {
    isNormalUser = true;
    initialPassword = "12345";
    description = "Felix Koppe";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  # Home Manager setup for user 'fkoppe'
  programs.fuse.userAllowOther = true;
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "fkoppe" = import ../home/fkoppe/default.nix;
    };
  };
}
