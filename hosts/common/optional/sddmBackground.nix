{ config, lib, pkgs, sddmBackground, ... }:

let
  background-package = pkgs.stdenvNoCC.mkDerivation {
    name = "background-image";
    src = ./.;
    dontUnpack = true;
    installPhase = ''cp $src/wallpapers/${sddmBackground} $out'';
  };
in
{
  services.displayManager.sddm = {
    enable = true;
    theme = "breeze";
  };

  environment.systemPackages = [
    (
      pkgs.writeTextDir "share/sddm/themes/breeze/theme.conf.user" ''
        [General]
        background = ${background-package}
      ''
    )
  ];
}

