{ modulesPath, config, pkgs, lib, self, ... }:

{
  system.stateVersion = "23.05";

  # Allow the use of unfree packages
  nixpkgs.config.allowUnfree = true;

  # Sound
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;

  # Localization
  time.timeZone = "America/Detroit";
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "en_US.UTF-8";
      LC_IDENTIFICATION = "en_US.UTF-8";
      LC_MEASUREMENT = "en_US.UTF-8";
      LC_MONETARY = "en_US.UTF-8";
      LC_NAME = "en_US.UTF-8";
      LC_NUMERIC = "en_US.UTF-8";
      LC_PAPER = "en_US.UTF-8";
      LC_TELEPHONE = "en_US.UTF-8";
      LC_TIME = "en_US.UTF-8";
    };
  };

  # Enable Services.
  services = {
    printing.enable = true;
    xserver = {
      enable = true;
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
      layout = "us";
      xkbVariant = "";
    };
    pipewire = {
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      pulse.enable = true;
      jack.enable = true;
    };
  };
  nix = {
    # Sets flakes to unstable track instead of stable #
    package = pkgs.nixUnstable; # or versioned attributes like nix_2_4
    # Enable flakes and nix-command
    extraOptions = ''experimental-features = nix-command flakes'';
    # Auto maintainence
    settings.auto-optimise-store = lib.mkDefault true;
    # Garbage collection
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };
  speccon18.desktop.hyperland.enable = true;
  speccon18.desktop.gnome.enable = false;
}