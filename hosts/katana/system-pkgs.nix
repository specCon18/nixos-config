{ modulesPath, config, pkgs, lib, self, ... }:
{
    environment.systemPackages = with pkgs; [
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
        python39  
        gcc
        bottom
  ];
}