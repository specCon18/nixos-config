{ pkgs, config, lib, ...}:
{
  programs.zellij = {
    enable = true;
    package = pkgs.zellij;
  };
}