{ pkgs, config, lib, ...}:
{
  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = ''
      bind = SUPER, Return, exec, alacritty
      bind = CONTROL_SHIFT, W, exec, firefox
    '';
  };
}
