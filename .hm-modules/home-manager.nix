{ config, pkgs, lib, ... }:
{
# https://github.com/arouzing/nix/blob/main/hm/sky/home.nix
  home = {
    username = "speccon18";
    homeDirectory = "/home/speccon18";
    stateVersion = "22.11";
  };
  direnv = {
    enableZshIntegration = true;
    enable = true;
  };
  starship = {
    enable = true;
    enableZshIntegration = true;
  };
  zsh = {
    enable = true;
  };
}