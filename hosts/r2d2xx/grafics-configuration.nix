{ config, pkgs, ... }:

{
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia.open = true;

  # Configure hardware-specific NVIDIA options
  hardware.nvidia = {
    modesetting = true;
    optimus = true;
    prime = {
    offload.enable = true;
    offload.enableOffloadCmd = true;
    intelBusId = "PCI:0:2:0";
    nvidiaBusId = "PCI:1:0:0";
  };
  };

  hardware.opengl = {
    extraPackages = with pkgs; [ pkgs.nvidia_x11 ];
  };

  services.xserver.nvidiaPrime.enable = true;
}
