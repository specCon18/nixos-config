{ modulesPath, config, pkgs, lib, ... }:

{
  imports = [
    # Include the results of the hardware scan.
    (modulesPath + "/profiles/qemu-guest.nix")
    ../.modules/services/docker.nix
    ../.modules/users/speccon18.nix
    ../.modules/services/openssh.nix
    ../.modules/features/desktop/environments/gnome.nix
    ../.modules/features/desktop/applications/speccon18.nix
  ];
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
    zsh
    vim
    micro
    tailscale
    direnv
    uutils-coreutils
  ];

  networking = {
    firewall.checkReversePath = "loose";
    hostName = "creatorforge"; # Define your hostname.
    # networkmanager.enable = true;
  };

  services.tailscale.enable = true;

  time.timeZone = "America/Detroit";

  # Open ports in the firewall.
  networking.firewall = { 
    enable = true;
    allowedTCPPorts = [];
    allowedUDPPorts = [];
  };
  ## main services
  system.stateVersion = "22.11";

  ### testing ###
  boot.initrd.availableKernelModules = [ "ata_piix" "uhci_hcd" "virtio_pci" "sr_mod" "virtio_blk" ];
  

}