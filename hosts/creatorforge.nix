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
    htop
    bat
    exa
    helix
    zsh
    tailscale
    dig
    rage
    sops
    direnv
    htop
  ];

  networking = {
    hostName = "creatorforge"; # Define your hostname.
    firewall = {
      enable = true;
      allowedTCPPorts = [];
      allowedUDPPorts = [];
      checkReversePath = "loose";
    };
  };

  services.tailscale.enable = true;
}