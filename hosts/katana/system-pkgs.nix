{ modulesPath, config, pkgs, lib, self, ... }:
{
    environment.systemPackages = with pkgs; [
        bluez
        blueman
        nerdfonts
        home-manager
        pkg-config
        ripgrep
        openssl
        tree
        exa
        htop
        zsh
        dig #dns lookup
        rage #file encryption
        age-plugin-yubikey #plugin for rage to manage yubi-2fa
        sops #file based secrets operations
        direnv #used for development environments
        python311Packages.pip 
        python311
        python311Packages.pygithub
        gcc
        bottom
        felix-fm
        gitui
        spotify
        zulip
        surrealdb
  ];
}