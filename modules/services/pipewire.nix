# https://nixos.wiki/wiki/PipeWire
{ config, pkgs, lib, ... }:
{
    # Remove sound.enable or turn it off if you had it set previously, it seems to cause conflicts with pipewire
    #sound.enable = false;
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