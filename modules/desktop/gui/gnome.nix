{ config, pkgs, lib, ... }:
{
  # Gnome extensions
  environment.systemPackages = with pkgs; [
    gnomeExtensions.dock-from-dash
    gnomeExtensions.pop-shell
  ];
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
          gdm = {
            enable = true;
            wayland = true;
          };
          defaultSession = lib.mkDefault "gnome";
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
