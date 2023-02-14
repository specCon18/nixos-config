{ config, pkgs, lib, ... }:
{
  imports = [
    ./users/speccon18.nix
  ];
  programs.home-manager.enable = true;

# https://github.com/arouzing/nix/blob/main/hm/sky/home.nix

}