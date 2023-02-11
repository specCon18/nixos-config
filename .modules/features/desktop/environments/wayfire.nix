{ config, pkgs, lib, ... }:
{
  environment.systemPackages = with pkgs; [
    inputs.nixpkgs-wayland.packages.${system}.wayfire-unstable
  ];
}