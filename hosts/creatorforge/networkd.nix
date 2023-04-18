{ modulesPath, config, pkgs, lib, self, ... }:
{
  networking = {
    hostName = "creatorforge"; # Define your hostname.
    useDHCP = lib.mkForce true;
    firewall = {
      enable = true;
      allowedTCPPorts = [];
      allowedUDPPorts = [];
      checkReversePath = "loose";
    };
  };
}