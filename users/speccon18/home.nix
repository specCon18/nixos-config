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
}
