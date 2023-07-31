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
      bitwarden
      firefox
      discord
      nodejs-18_x
      fira-code
      gimp
      obsidian
      neofetch
      vlc
      remmina
      bacon
      bottom
      broot
    ];
  };  
}
