{ config, pkgs, inputs, ... }: {
  # Define user fkoppe
  users.users.fkoppe = {
    isNormalUser = true;
    #initialPassword = "12345";
    hashedPassword = "$6$Zr8h87nJJiWLcB0a$4bVDfu2dzUu9.CF0DataPDAnHQTTffpLKS/jy4q.VbwdgJWc2pdoXxZD5Hzy8BDbZL3gYu8ozEpj0iewPHGg7.";
    description = "Felix Koppe";
    extraGroups = [ "audio" "networkmanager" "video" "wheel" ];
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
