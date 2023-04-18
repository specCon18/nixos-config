# https://nixos.wiki/wiki/PipeWire
{ config, pkgs, lib, ... }:
{
    environment.systemPackages = with pkgs; [
      pipewire
      wireplumber      
    ];
    # rtkit is optional but recommended
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      pulse.enable = true;
      jack.enable = true;
    };
}