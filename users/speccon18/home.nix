{ pkgs, config, lib, ... }:
{  
  home = {
    username = "speccon18";
    homeDirectory = "/home/speccon18";
    stateVersion = "22.11";
    packages = with pkgs; [
      inkscape
      freecad
      calibre
      bitwarden
      firefox
      discord
      nodejs_20
      fira-code
      gimp
      obsidian
      neofetch
      vlc
      remmina
      bacon
    ];
  };  
}
