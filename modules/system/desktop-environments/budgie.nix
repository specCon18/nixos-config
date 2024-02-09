{ config, pkgs, lib, ...}:
{
  
    environment.systemPackages = with pkgs; [
      budgie.budgie-desktop-with-plugins
    ];
    services.xserver = {
      enable = true;
      desktopManager.budgie.enable = true;
    };
}

