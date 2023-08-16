{ pkgs, config, lib, ...}:
{
  wayland.windowManager.hyprland = {
    systemdIntegration = true;
    enable = true;
    extraConfig = ''
      bind = SUPER, Return, exec, alacritty
      bind = CONTROL_SHIFT, W, exec, firefox
      bind = SUPER, R, exec, rofi -show drun
      exec-once=waybar
      exec-once=dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
      exec-once=mako
    '';
  };
}
