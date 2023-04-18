{ pkgs, config, lib, ...}:
{
  programs.ncspot = {
    enable = true;
    package = pkgs.ncspot;
  };
}