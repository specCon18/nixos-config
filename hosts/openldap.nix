{ modulesPath, config, pkgs, lib, ... }:

{
  imports = [
        (modulesPath + "/profiles/qemu-guest.nix")
        ../modules/services/docker.nix
        ../modules/users/arouzing.nix
        ../modules/users/speccon18.nix
        ../modules/services/openssh.nix
    ];

    # base packages
    environment.systemPackages = with pkgs; [
      htop
      vim
      nano
      tailscale
    ];

  networking = {
    hostName = "openldap"; # Define your hostname.
    firewall = { 
      enable = true;
      allowedTCPPorts = [];
      allowedUDPPorts = [];
      checkReversePath = "loose";
    };
    # networkmanager.enable = true;
  };

  services.tailscale.enable = true;

  time.timeZone = "America/Detroit";

  ## main services
  system.stateVersion = "22.11";

  ### testing ###
  boot.initrd.availableKernelModules = [ "ata_piix" "uhci_hcd" "virtio_pci" "sr_mod" "virtio_blk" ];
  

}