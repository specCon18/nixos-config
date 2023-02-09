{ config, pkgs, lib, ... }:
{
  services = {
    gnome = {
      core-utilities.enable = false;
      gnome-keyring.enable = true;
    };
    
    xserver = {
        enable = true;
        layout = "us";
        xkbVariant = "";
        displayManager = {
              gdm.enable = true;
              gdm.wayland = true;
              # defaultSession = lib.mkDefault "gnome";
        };
      desktopManager = {
        xterm.enable = lib.mkForce false;
        gnome.enable = lib.mkDefault true;
      };
    };
  };
  
  programs = {
    xwayland.enable = lib.mkDefault true;
  };
  
  xdg.portal = { enable = lib.mkDefault true; };

}