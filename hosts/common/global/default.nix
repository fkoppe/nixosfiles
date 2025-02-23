{ config, pkgs, lib, ... }: {
  imports = [
    ./locale.nix
    ./packages.nix
    ./persist.nix
    ./createHome.nix
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Delete all except /persist on boot
  boot.initrd.postDeviceCommands = lib.mkAfter ''
    mkdir /btrfs_tmp
    mount /dev/root_vg/root /btrfs_tmp
    if [[ -e /btrfs_tmp/root ]]; then
        mkdir -p /btrfs_tmp/old_roots
        timestamp=$(date --date="@$(stat -c %Y /btrfs_tmp/root)" "+%Y-%m-%-d_%H:%M:%S")
        mv /btrfs_tmp/root "/btrfs_tmp/old_roots/$timestamp"
    fi

    delete_subvolume_recursively() {
        IFS=$'\n'
        for i in $(btrfs subvolume list -o "$1" | cut -f 9- -d ' '); do
            delete_subvolume_recursively "/btrfs_tmp/$i"
        done
        btrfs subvolume delete "$1"
    }

    for i in $(find /btrfs_tmp/old_roots/ -maxdepth 1 -mtime +30); do
        delete_subvolume_recursively "$i"
    done

    btrfs subvolume create /btrfs_tmp/root
    umount /btrfs_tmp
  '';

  # Enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Configure console keymap
  console.keyMap = "de";

  #TODO
  services.printing = { enable = true; drivers = [ pkgs.epson-escpr ]; };

  #for network device discouvery
  services.avahi = { enable = true; nssmdns4 = true; };

  # Enable networking
  networking.networkmanager.enable = true;

  #TODO do i want this?
  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];

  #TODO
  programs.ssh.startAgent = true;

  #TODO
  environment.sessionVariables.NIXOS_OZONE_WL = "1"; #for wayland

  #TODO
  hardware.opengl = {
    enable = true;
    #driSupport = true;
    #driSupport32Bit = true;
  };


    #services.xserver.videoDrivers = [ "nvidia" ];
  #hardware.nvidia.modesetting.enable = true;




  #hardware.nvidia.prime = {
  #  offload = {
 #     enable = true;
   #   enableOffloadCmd = true;
   # };
  #  intelBusId = "PCI:0:2:0";
 #   nvidiaBusId = "PCI:1:0:0";
 # };

  #programs.steam.enable = true;

  #programs.steam.gamescopeSession.enable = true;

  #environment.systemPackages = with pkgs; [ mangohud  ];

  #programs.gamemode.enable = true;
}
