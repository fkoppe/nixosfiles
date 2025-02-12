{ config, pkgs, ... }:

{
  users.users.koppe = {
    isNormalUser = true;
    home = "/home/koppe";
    shell = pkgs.bash;
    extraGroups = [ "wheel" ];
  };
}
