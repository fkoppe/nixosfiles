{ config, pkgs, ... }:

{
    # Enable the X server and specify video drivers
    services.xserver = {
        enable = true;
        videoDrivers = [ "intel" "nvidia" "amdgpu" ];
        # Configure keyboard layout for X11
        xkb = {
        layout = "de";
        variant = "";
        };
  };

  # Enable KDE Plasma 6
  services.xserver.desktopManager.plasma6 = {
    enable = true;
  };

  # Configure the display manager (SDDM)
  services.xserver.displayManager.sddm = {
    enable = true;
    theme = "breeze";
    wayland.enable = false;
  };
}
