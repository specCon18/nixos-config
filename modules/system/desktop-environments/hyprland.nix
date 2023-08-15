{ config, pkgs, lib, ... }:
{
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
  hardware = {
     opengl.enable = true;
     nvidia.modesetting.enable = true;
  };
}