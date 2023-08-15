{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    initrd = {
      availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usb_storage" "sd_mod" ];
      kernelModules = [ ];
    };
    kernelModules = [ "kvm-intel" ];
    extraModulePackages = [ ];
    # Prevent tampering of the pkgstore
    readOnlyNixStore = true;
  };
  nix = {    
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };
  fileSystems."/" = {
      device = "/dev/disk/by-uuid/55c746b3-b9dc-4c9b-ab56-de68a561f9a3";
      fsType = "ext4";
    };

  fileSystems."/boot" = {
      device = "/dev/disk/by-uuid/0C59-9996";
      fsType = "vfat";
    };

  swapDevices = [ ];


  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}