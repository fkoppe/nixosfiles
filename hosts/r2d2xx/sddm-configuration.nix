{ config, pkgs, lib, ... }:

let
  sddmBackground = "4k/forest.jpg";
  sddmModule = import ../common/optional/sddmBackground.nix { inherit config lib pkgs sddmBackground; };
in
{
  imports = [ sddmModule ];
}
