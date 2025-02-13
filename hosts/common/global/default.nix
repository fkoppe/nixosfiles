{ config, pkgs, ... }: {
    home.sessionVariables = {
    HOSTNAME = config.networking.hostName;
  };
}
