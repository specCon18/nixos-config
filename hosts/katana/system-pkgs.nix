{ modulesPath, config, pkgs, lib, self, ... }:
{
    environment.systemPackages = with pkgs; [
        bluez
        blueman
        nerdfonts
        pkg-config
        ripgrep
        openssl
        tree
        unrar
        unzip
        gzip
        p7zip
        bzip2
        dconf2nix
        bat
        exa
        uutils-coreutils
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
        swww
        rofi
        prismlauncher
        parallel
  ];
}