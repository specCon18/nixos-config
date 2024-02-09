{
  config,
  pkgs,
  lib,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;
  cfg = config.speccon18.desktop.budgie;
in {
  options.speccon18.desktop.budgie = {
    enable = mkEnableOption "enables specs custom budgie setup";
  };
  config = mkIf cfg.enable {
  
    environment.systemPackages = with pkgs; [
      budgie.budgie-desktop-with-plugins
    ];
    services.xserver = {
      enable = true;
      desktopManager.budgie.enable = true;
    };
}

