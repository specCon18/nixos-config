{ config, pkgs, lib, ... }:
{
  environment.systemPackages = with pkgs; [
    tailscale
    firefox
    vscodium-fhs
    alacritty
    starship
  ];
  programs = {
    zsh.enable = lib.mkDefault true;
  };
}