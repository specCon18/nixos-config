{ modulesPath, config, pkgs, lib, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
        # ../.modules/base/hardware.nix
        (modulesPath + "/profiles/qemu-guest.nix")
        ../.modules/services/docker.nix
        ../.modules/users/arouzing.nix
        ../.modules/users/speccon18.nix
        ../.modules/services/openssh.nix
    ];

    # base packages
    environment.systemPackages = with pkgs; [
      htop
      vim
      nano
      tailscale
    ];

  networking = {
    firewall.checkReversePath = "loose";
    hostName = "openldap"; # Define your hostname.
    # networkmanager.enable = true;
  };

  services.tailscale.enable = true;

  time.timeZone = "America/New_York";

  # Open ports in the firewall.
  networking.firewall = { 
    enable = true;
    allowedTCPPorts = [];
    allowedUDPPorts = [];
  };
  ## main services
  system.stateVersion = "22.11";

  ### testing ###
  boot.initrd.availableKernelModules =
    [ "ata_piix" "uhci_hcd" "virtio_pci" "sr_mod" "virtio_blk" ];
  

}