{ modulesPath, config, pkgs, lib, self, ... }:

{
  # Sets the default version to track for system-pkgs
  system.stateVersion = "22.11"; 
  # Set the default timezone 
  time.timeZone = lib.mkDefault "America/Detroit";
  # Allow non opensource software to be installed
  nixpkgs.config.allowUnfree = true;
  # NixOS Settings
  nix = {
    # Sets flakes to unstable track instead of stable #
    package = pkgs.nixUnstable; # or versioned attributes like nix_2_4
    # Enable flakes and nix-command
    extraOptions = ''experimental-features = nix-command flakes'';
    # Auto maintainence
    settings.auto-optimise-store = lib.mkDefault true;
    # Prevent tampering of the pkgstore
    readOnlyStore = true;
    # Garbage collection
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };
}