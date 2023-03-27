{ pkgs, config, lib, ... }: {  
  home = {
    username = "speccon18";
    homeDirectory = "/home/speccon18";
    stateVersion = "22.11";
    packages = with pkgs; [
      nushell
      firefox
      discord
      nodejs-18_x
      spotify
      nerdfonts
      fira-code
      libreoffice
      asciinema
      postman
      gimp
      rustup
      neofetch
      vlc
      remmina
      signal-desktop
      starship
      alacritty
      uutils-coreutils
    ];
  };

  programs = {
    nushell = {
      enable = true;
    };
    starship = {
      enable = true;
      enableZshIntegration = true;
      enableNushellIntegration = true;
    };
    zsh = {
      enable = lib.mkDefault true;
      dotDir = ".config/zsh";
      history = {
        path = "$ZDOTDIR/.zsh_history";
        save = 10000000;
      };
    };
    direnv = {
      enable = true;
      enableZshIntegration = lib.mkDefault true;
    };
    home-manager = {
      enable = true;
    };
    vscode = {
      enable = true;
      package = pkgs.vscode.fhs;
      enableExtensionUpdateCheck = true;
      enableUpdateCheck = false;
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

  dconf.settings = {
    "org/gnome/mutter" = {
      experimental-features = [ "x11-randr-fractional-scaling" ];
    };
  };
}
