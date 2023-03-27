{ config, pkgs, lib, ... }:
{
  users.users.speccon18 = {
    shell = pkgs.nushell;
    isNormalUser = true;
    initialHashedPassword = "$y$j9T$RdLBHOvUpb17egl0d16LT/$3Y2RD/tT1IZ0nkfAR13pp3IzBjvKLRgGpDPLobUeO23";
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILdigmndcdQD/864P059K2hZOXyEkbGvMkH0/b2QavkD speccon18@creatorforge"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPc1AQ6hcjdSZZuhS5SISwtulFoTLpC5f5JoMFQkZ5l2 specCon18@DESKTOP-Q1I2PAE"
    ];
    description = "admin";
    extraGroups = [ "wheel" "docker" ];
  };
}