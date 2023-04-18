{ pkgs, config, lib, ... }:
{  
  home = {
    username = "speccon18";
    homeDirectory = "/home/speccon18";
    stateVersion = "22.11";
    packages = with pkgs; [
      inkscape
      freecad
      prismlauncher
      calibre
      w3m
      bitwarden
      firefox
      discord
      nodejs-18_x
      nerdfonts
      fira-code
      libreoffice
      asciinema
      postman
      gimp
      obsidian
      neofetch
      vlc
      remmina
      signal-desktop
      just
      bacon
      bottom
      xplr
      broot
    ];
  };
  
  programs = {
    zoxide = {
      enable = true;
      enableZshIntegration = lib.mkDefault true;
#      enableNushellIntegration = false;
    };
    ncspot = {
      enable = true;
      package = pkgs.ncspot;
    };

    zellij = {
      enable = true;
      package = pkgs.zellij;
    };
    nushell = {
      enable = false;
    };
    starship = {
      enable = true;
      enableZshIntegration = true;
      enableNushellIntegration = false;
    };

    direnv = {
      enable = true;
      enableZshIntegration = lib.mkDefault true;
    };
    home-manager = {
      enable = true;
    };

    git = {
      enable = true;
      userName = "specCon18";
      userEmail = "steven.carpenter@skdevstudios.com";
      extraConfig = {
        init = {
          defaultBranch = "main";
        };
      };
    };
  };
  dconf = {
    enable = true;
    settings = {
      "org/gnome/mutter" = {
          attach-modal-dialogs = true;
          dynamic-workspaces = true;
          edge-tiling = false;
          experimental-features = [ "scale-monitor-framebuffer" ];
          focus-change-on-pointer-rest = true;
          workspaces-only-on-primary = true;
      };
    };
  };
}
