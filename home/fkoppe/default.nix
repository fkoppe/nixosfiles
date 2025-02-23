{ config, pkgs, inputs, ... }: {
  home.username = "fkoppe";
  home.homeDirectory = "/home/fkoppe";

  # Allow unfree in home-manager
  nixpkgs.config.allowUnfree = true;

  imports = [
    inputs.impermanence.nixosModules.home-manager.impermanence
  ];

  home.persistence."/persist/home/fkoppe" = {
    directories = [
      # User data
      "Documents"
      "Downloads"
      "Music"
      "Pictures"
      "Videos"
      "Trash"

      # NixOs config
      "nixosfiles"

      ".gnupg"
      ".nixops"

      # SSH
      ".ssh"

      # Bash history
      ".local/share/bash"

      # Telegram
      ".local/share/64Gram"

      ".local/share/keyrings"
      ".local/share/direnv"

      # Browser
      ".mozilla"
      ".librewolf"

      # VsCode
      ".config/Code/User"

      # Tidal
      ".config/tidal-hifi"

      # KeePassXc
      ".config/keepassxc"

      # IntelliJ
      "IdeaProjects"

      # Steam
      {
        directory = ".local/share/Steam";
        method = "symlink";
      }
    ];
    files = [
      # Password safe file
      "safe.kdbx"

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
      extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
        ublock-origin
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
