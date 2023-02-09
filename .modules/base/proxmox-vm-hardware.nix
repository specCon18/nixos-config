 {config, lib, pkgs, modulesPath, ... }:

# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [ 
      (modulesPath + "/profiles/qemu-guest.nix")
      (modulesPath + "/installer/scan/not-detected.nix")
    ];

  system.stateVersion = "22.11";
  
  boot = {
    loader.systemd-boot.enable = "true";
    initrd = {
      availableKernelModules = [ "uhci_hcd" "ehci_pci" "ahci" "virtio_pci" "virtio_blk" "uas"];
      kernelModules = [ ];
    }
    kernelModules = [ "kvm-amd" ];
    extraModulePackages = [ ];
  }
  
  fileSystems."/" =
    { device = "/dev/disk/by-uuid/40fe3178-6ec1-450f-93fd-c359f2f3daf9";
      fsType = "ext4";
    };

  swapDevices = [  ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.docker0.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp6s18.useDHCP = lib.mkDefault true;
  # networking.interfaces.tailscale0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  # This helps stay in step with genertator due to being in vm
  boot = {
    growPartition = true;
    kernelParams = [ "console=ttyS0" ];
    loader.grub = {
      device = lib.mkDefault (if (hasNoFsPartition || supportBios) then
        # Even if there is a separate no-fs partition ("/dev/disk/by-partlabel/no-fs" i.e. "/dev/vda2"),
        # which will be used the bootloader, do not set it as loader.grub.device.
        # GRUB installation fails, unless the whole disk is selected.
        "/dev/disk/by-uuid/40fe3178-6ec1-450f-93fd-c359f2f3daf9"
      else
        "nodev");
      efiSupport = lib.mkDefault supportEfi;
      efiInstallAsRemovable = lib.mkDefault supportEfi;
    };

    loader.timeout = 0;
  };

#  fileSystems."/" = {
#    device = "/dev/disk/by-label/nixos";
#    autoResize = true;
#    fsType = "ext4";
#  };
#  fileSystems."/boot" = lib.mkIf hasBootPartition {
#    device = "/dev/disk/by-label/ESP";
#    fsType = "vfat";
#  };

  services.qemuGuest.enable = lib.mkDefault true;
}