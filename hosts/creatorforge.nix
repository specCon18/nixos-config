{ modulesPath, config, pkgs, lib, ... }:

{
  system.stateVersion = "22.11";  
  time.timeZone = "America/Detroit";

  # Allow non opensource software to be installed
  nixpkgs.config.allowUnfree = true;
  
  nix = {
    ## NIX FLAKES ##
    package = pkgs.nixUnstable; # or versioned attributes like nix_2_4
    # enable flakes
    extraOptions = ''experimental-features = nix-command flakes'';
    # auto maintainence
    settings.auto-optimise-store = lib.mkDefault true;
    # prevent tampering
    readOnlyStore = true;
    # garbage collections
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };
  # base packages
  environment.systemPackages = with pkgs; [
    cargo
    rustc
    helix
    bat
    exa
    uutils-coreutils
    htop
    zsh
    tailscale
    dig #dns lookup
    rage #file encryption
    age-plugin-yubikey #plugin for rage to manage yubi-2fa
    sops #file based secrets operations
    direnv #used for development environments
  ];

  networking = {
    hostName = "creatorforge"; # Define your hostname.
    useDHCP = lib.mkForce true;
    firewall = {
      enable = true;
      allowedTCPPorts = [];
      allowedUDPPorts = [];
      checkReversePath = "loose";
    };
  };
}