{ config, pkgs, lib, ... }:
{
  programs.zsh.enable = true;
  users.users.speccon18 = {
    shell = pkgs.zsh;
    isNormalUser = true;
    initialHashedPassword = "$y$j9T$RdLBHOvUpb17egl0d16LT/$3Y2RD/tT1IZ0nkfAR13pp3IzBjvKLRgGpDPLobUeO23";
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIrZpH5QV62dtTb2yx5I3PF2lJyNpPkV57pDlo6xawID"
    ];
    description = "Steven Carpenter";
    extraGroups = [
      "wheel"
      "docker"
    ];
  };
services.xremap = {
  withWlroots = true;
  userName = "speccon18";
  config = {
    keymap = [
      {
        name = "Global";
        remap = {
          "CapsLock" = "Esc";
          "Print" = {
            launch = [ "zsh" "-c" "grim -o /home/speccon18/Pictures/$(date +'%s_grim.png') -g $(slurp) -t png" ];
          };
        };
      }
    ];
  };
};

}