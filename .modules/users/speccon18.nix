{ config, pkgs, lib, ... }:
{
    users.users.speccon18 = {
    isNormalUser = true;
    initialHashedPassword = "";
    openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILdigmndcdQD/864P059K2hZOXyEkbGvMkH0/b2QavkD speccon18@creatorforge"
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPc1AQ6hcjdSZZuhS5SISwtulFoTLpC5f5JoMFQkZ5l2 specCon18@DESKTOP-Q1I2PAE"
    ];
    description = "admin";
    extraGroups = [ "wheel" "docker" ];
  };
}