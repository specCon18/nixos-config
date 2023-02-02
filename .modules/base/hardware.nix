 {config, lib, pkgs, modulesPath, ... }:

{
  system.stateVersion = "22.11";
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];
  networking.useDHCP = true;
  # boot.initrd.availableKernelModules = [ "uhci_hcd" "ehci_pci" "ahci" "usbhid" "sd_mod" "sdhci_pci" ];
  # boot.initrd.kernelModules = [ "dm-snapshot" ];
  # boot.kernelModules = [ "kvm-intel" "wl" ];
  # boot.extraModulePackages = [ config.boot.kernelPackages.broadcom_sta ];
  # hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}