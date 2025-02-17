{ config, pkgs, lib, ... }:

let
  sddmBackground = "forest.jpg";
  sddmModule = import ../common/optional/sddm.nix { inherit config lib pkgs sddmBackground; };
in
{
  imports = [ sddmModule ];

  # Additional host-specific configurations can go here
}
