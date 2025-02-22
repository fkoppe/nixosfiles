{ config, pkgs, ... }: {
  # Enable X11
  services.xserver.enable = true;

  # Enable KDE Plasma 6 Desktop Environment
  services.desktopManager.plasma6.enable = true;

  # Enable SDDM
  services.displayManager.sddm.enable = true;

  # Configure keymap in X11
   services.xserver.xkb.layout = "de";
}
