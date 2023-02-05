{ config, pkgs, lib, ... }:
{
    users.users.speccon18 = {
    isNormalUser = true;
    initialHashedPassword = "$6$pJB0TDUj8IS8hQNJ$GfENlHg89lsUjRiSaePWJeqX1pevTTZOuEw5KgcVEpyPw9lyiAifz5ZiuOQnYxUAMhAiCmF/pCjaWSy6m5sWM/";
    openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILdigmndcdQD/864P059K2hZOXyEkbGvMkH0/b2QavkD speccon18@creatorforge"
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPc1AQ6hcjdSZZuhS5SISwtulFoTLpC5f5JoMFQkZ5l2 specCon18@DESKTOP-Q1I2PAE"
    ];
    description = "admin";
    extraGroups = [ "wheel" "docker" ];
  };
}