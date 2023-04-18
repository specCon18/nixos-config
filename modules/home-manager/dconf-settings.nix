{ pkgs, config, lib, ...}:
{
  dconf = {
    enable = true;
    settings = {
      "org/gnome/mutter" = {
          attach-modal-dialogs = true;
          dynamic-workspaces = true;
          edge-tiling = false;
          experimental-features = [ "scale-monitor-framebuffer" ];
          focus-change-on-pointer-rest = true;
          workspaces-only-on-primary = true;
      };
    };
  };
}