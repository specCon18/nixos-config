{ pkgs, config, lib, ...}:
{
  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = ''
      bind = SUPER, Return, exec, alacritty
      bind = CONTROL_SHIFT, W, exec, firefox
      bind = CONTROL_SHIFT, Lm, exec, rofi -show drun
      exec-once=/usr/lib/polkit-kde-authentication-agent-1
      exec-once=waybar
    '';
  };
}
