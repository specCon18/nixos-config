{ config, pkgs, lib, ... }:

{
  home-manager.users.speccon18 = {
    home.packages = [
      firefox
      vscodium-fhs
      alacritty
      starship
      diff-so-fancy
    ];
  };
  programs = {
    home = {
      username = "speccon18";
      homeDirectory = "/home/speccon18";
      stateVersion = "22.11";
    };
    direnv = {
      enableZshIntegration = true;
      enable = true;
    };
    starship = {
      enable = true;
      enableZshIntegration = true;
    };
    zsh = {
      enable = lib.mkDefault true;
      dotDir = ".config/zsh";
      history = {
        path = "$ZDOTDIR/.zsh_history";
        save = 10000000;
      };
    };
    git = {
      enable = true;
      userName = "specCon18";
      userEmail = "specCon18@gmail.com";
    #  signing = {
    #    key = "71F252936D785219";
    #    signByDefault = true;
    #  };
      diff-so-fancy = {
        enable = true;
        changeHunkIndicators = true;
      };
      lfs.enable = true;
    };
  };
}