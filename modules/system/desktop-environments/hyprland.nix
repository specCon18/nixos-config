{
  config,
  pkgs,
  lib,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;
  cfg = config.speccon18.desktop.hyprland;
in {
  options.speccon18.desktop.hyprland = {
    enable = mkEnableOption "enables specs custom hyprland setup";
  };
  config = mkIf cfg.enable {
    programs.hyprland = {
      enable = true;
      nvidiaPatches = true;
      xwayland.enable = true;
    };
    environment = {
      systemPackages = with pkgs; [
        # libsForQt5.polkit-kde-agent
        libsForQt5.qt5.qtwayland
        qt6.full
        qt6.qtwayland
        waybar
        swww
        pw-volume
        rofi-wayland
        libnotify
        mako
        xdg-desktop-portal-hyprland
      ];
      sessionVariables = {
        WLR_NO_HARDWARE_CURSORS = "1";
        NIXOS_OZONE_WL = "1";
      };
    };
    xdg.portal = {
      enable = true;
      extraPortals = [
        pkgs.xdg-desktop-portal-hyprland
        pkgs.xdg-desktop-portal-gtk
      ];
    };
    hardware = {
      opengl.enable = true;
      nvidia.modesetting.enable = true;
    };
  };
}