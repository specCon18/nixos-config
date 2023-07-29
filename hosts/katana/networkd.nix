 
{ modulesPath, config, pkgs, lib, self, ... }:

{
  networking = {
    hostName = "katana"; # Define your hostname.
    networkmanager.enable = true; #Enable Network Manager
    firewall = {
      checkReversePath = "loose";
      allowedTCPPorts = [];
      allowedUDPPorts = [];
    };
  };
}