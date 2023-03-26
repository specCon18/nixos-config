{ config, pkgs, lib, ... }:

{
  home = {
    username = "speccon18";
    homeDirectory = "/home/speccon18";
    stateVersion = "22.11";
    packages = [
      pkgs.firefox
      pkgs.vscode-fhs
      pkgs.alacritty
      pkgs.starship
      pkgs.diff-so-fancy
      pkgs.bat
      pkgs.nushell
    ];
  };
  programs = {
    #TODO: https://mipmip.github.io/home-manager-option-search/ add options  
    vscode = {
      enable = true;
      enableExtensionUpdateCheck = true;
      enableUpdateCheck = false;
    };
    #Generate and add configs for this
    nushell = {
      enable = true;
    };
    direnv = {
      enableZshIntegration = true;
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
    #git = {
    #  enable = true;
    #  userName = "specCon18";
    #  userEmail = "specCon18@gmail.com";
    #  signing = {
    #    key = "71F252936D785219";
    #    signByDefault = true;
    #  };
    #  diff-so-fancy = {
    #    enable = true;
    #    changeHunkIndicators = true;
    #  };
    #  lfs.enable = true;
    #};
  };
}
