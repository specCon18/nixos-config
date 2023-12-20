{ config, pkgs, lib, ...}:
let
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
        hyprland
        font-awesome
        brightnessctl
        grim
        slurp
        imagemagick
        wl-clipboard
      ];
      sessionVariables = {
        #Enable Wayland
        WLR_NO_HARDWARE_CURSORS = "1";
        NIXOS_OZONE_WL = "1";
        MOZ_ENABLE_WAYLAND = "1";
  	    GTK_USE_PORTAL = "1";
  	    NIXOS_XDG_OPEN_USE_PORTAL = "1";
        SDL_VIDEODRIVER = "wayland";

        # XDG_Config
        XDG_CURRENT_DESKTOP = "Hyprland";
  	    XDG_SESSION_DESKTOP = "Hyprland";
  	    XDG_SESSION_TYPE = "wayland";
  	    XDG_CACHE_HOME = "\${HOME}/.cache";
  	    XDG_CONFIG_HOME = "\${HOME}/.config";
  	    XDG_BIN_HOME = "\${HOME}/.local/bin";
  	    XDG_DATA_HOME = "\${HOME}/.local/share";

        #Default Applications
        BROWSER = "firefox";
        TERMINAL = "alacritty";
      };
    };
    xdg.portal = {
      enable = true;
      extraPortals = [
        pkgs.xdg-desktop-portal-gtk
        pkgs.xdg-desktop-portal-hyprland
      ];
    };
    hardware = {
      opengl.enable = true;
      nvidia.modesetting.enable = true;
    };
  };
}