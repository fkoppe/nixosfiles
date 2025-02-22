{ config, pkgs, vscode-extensions, ... }: {
  home.username = "fkoppe";
  home.homeDirectory = "/home/fkoppe";

  # Allow unfree in home-manager
  nixpkgs.config.allowUnfree = true;

  imports = [
    inputs.impermanence.nixosModules.home-manager.impermanence
  ];

  home.persistence."/persist/home/fkoppe" = {
    directories = [
      "Downloads"
      "Music"
      "Pictures"
      "Documents"
      "Videos"
      "Trash"
      "nixosfiles"
      #"VirtualBox VMs"
      ".gnupg"
      ".ssh"
      ".nixops"
      ".local/share/bash" # for bash history
      ".local/share/keyrings"
      ".local/share/direnv"
      ".mozilla"
      ".librewolf"
      ".config/Code/User"
      {
        directory = ".local/share/Steam";
        method = "symlink";
      }
    ];
    files = [
      ".screenrc"
    ];
    allowOther = true;
  };

  home.packages = with pkgs; [ tidal-hifi ];

  # Git
  programs.git = {
    enable = true;
    userName = "fkoppe";
    userEmail = "fkoppe@web.de";
  };

  # Bash
  programs.bash.enable = true;
  programs.bash.bashrcExtra =
  ''
    export HISTFILE="$HOME/.local/share/bash/history"
    export EDITOR=vim
    export VISUAL=kate
  '';


  # TODO
  programs.firefox = {
    enable = true;
    profiles.fkoppe = {
      extensions.packages = with inputs.firefox-addons.packages."x86_64-linux"; [
        ublock-origin
        #sponsor-block
        #youtube-shorts-block
        return-youtube-dislikes
        proton-pass
        proton-vpn
      ];

    };
  };



  # TODO
  programs.ssh.extraConfig = "

    Host github.com
      IdentityFile ~/.ssh/id_github_fkoppe
  ";



  # TODO
  programs.vscode = {
  enable = true;
  extensions = with pkgs.vscode-extensions; [
    # Gruvbox theme
    jdinhlife.gruvbox

    # Nix Language Support
    jnoortheen.nix-ide
  ];
  };




  home.stateVersion = "24.11";

  programs.home-manager.enable = true;
}
