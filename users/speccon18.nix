{ pkgs, config, ... }: {
  #Home manager configuration
  home.username = "speccon18";
  home.homeDirectory = "/home/speccon18";
  imports = [ ./../../home ./../../home/nixos ];

  home.packages = with pkgs; [
    loc
    element-desktop
    discord
    bat
    exa
    nodejs-18_x
    spotify
    dig
    nerdfonts
    age
    sops
    steam-run
    fira-code
    libreoffice
    asciinema
    postman
    gimp
    rustup
    neofetch
    htop
    vlc
    polymc
    remmina
    signal-desktop
  ];

  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;
  programs.home-manager.enable = true;

  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
  };

  programs.git = {
    enable = true;
    userName = "specCon18";
    userEmail = "steven.carpenter@skdevstudios.com";
    delta.enable = true;
    extraConfig = {
      init = {
        defaultBranch = "main";
      };
    };
  };

  dconf.settings = {
    "org/gnome/mutter" = {
      experimental-features = [ "x11-randr-fractional-scaling" ];
    };
  };
}
