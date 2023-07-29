{ modulesPath, config, pkgs, lib, self, ... }:
{
    environment.systemPackages = with pkgs; [
    ripgrep
    tree
    cargo
    feh
    unrar
    unzip
    gzip
    p7zip
    bzip2
    dconf2nix
    rustc
    bat
    exa
    mdbook
    uutils-coreutils
    htop
    zsh
    tailscale
    dig #dns lookup
    rage #file encryption
    age-plugin-yubikey #plugin for rage to manage yubi-2fa
    sops #file based secrets operations
    direnv #used for development environments
    python39  
    gcc
  ];
}