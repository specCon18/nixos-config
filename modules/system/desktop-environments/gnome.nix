{
  config,
  pkgs,
  lib,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;
  cfg = config.speccon18.desktop.gnome;
in {
  options.speccon18.desktop.gnome = {
    enable = mkEnableOption "enables specs custom gnome setup";
  };
  config = mkIf cfg.enable {
    # Gnome extensions
    environment.systemPackages = with pkgs; [
      gnomeExtensions.dock-from-dash
      gnomeExtensions.pop-shell
      gnome-extension-manager
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
          xterm.enable = false;
          gnome.enable = lib.mkDefault true;
        };
      };
  };
  
  programs = {
    xwayland.enable = lib.mkDefault true;
  };
  
  xdg = {
    # portal = { enable = lib.mkDefault true; };
    mime.defaultApplications = {
      "text/markdown" = "hx";
    };
  };
  };
}
