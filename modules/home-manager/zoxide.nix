{ pkgs, config, lib, ...}:
{
  programs.zoxide = {
    enable = true;
    enableZshIntegration = lib.mkDefault true;
  };
}