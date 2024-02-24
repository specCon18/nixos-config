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
      lightdm
    ];
    services.xserver = {
      enable = true;
      desktopManager.budgie.enable = true;
      displayManager.lightdm.enable = true;
    };
  };
}

