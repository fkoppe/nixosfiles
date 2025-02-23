{ config, pkgs, lib, ... }: {
systemd.services."persist-home-create-root-paths" =
let
  persistentHomesRoot = "/persist/home"; # Define your persistent home root

  # Create a shell script as a single string
  listOfCommands = builtins.concatStringsSep "\n" (lib.mapAttrsToList
    (userName: user: ''
      userHome="${persistentHomesRoot}/${userName}"
      if [[ ! -d "$userHome" ]]; then
          echo "Persistent home root folder '$userHome' not found, creating..."
          mkdir -p --mode=0755 "$userHome"
          chown ${user.name}:${user.group} "$userHome"
      fi
    '') (lib.filterAttrs (_: user: user.createHome or false) config.users.users));

in {
  script = ''
    set -e  # Exit on error
    ${listOfCommands}
  '';

  unitConfig = {
    Description = "Ensure users' home folders exist in the persistent filesystem";
    PartOf = [ "local-fs.target" ];
    After = [ "persist-home.mount" ];
  };

  serviceConfig = {
    Type = "oneshot";
    StandardOutput = "journal";
    StandardError = "journal";
  };

  wantedBy = [ "local-fs.target" ];
};
}
