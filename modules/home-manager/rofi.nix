{ pkgs, config, lib, ...}:
{
  programs.rofi = {
    enable = true;
    theme = "android_notification";
    location = "top-left";
  };
}