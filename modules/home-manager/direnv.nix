{ pkgs, config, lib, ...}:
{
  programs.direnv = {
    enable = true;
    enableZshIntegration = lib.mkDefault true;
  };
}