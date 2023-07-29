{config, lib, pkgs, modulesPath, ... }:
{
  services.syncthing = {
    enable = true;
    tray.enable = true;
  };
}