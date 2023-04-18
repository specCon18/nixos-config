{ pkgs, config, lib, ...}:
{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    enableNushellIntegration = false;
  };
}