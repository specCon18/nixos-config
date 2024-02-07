{ pkgs, config, lib, ... }:
{  
  home = {
    username = "speccon18";
    homeDirectory = "/home/speccon18";
    
    # This value determines the Home Manager release that your
    # configuration is compatible with. This helps avoid breakage
    # when a new Home Manager release introduces backwards
    # incompatible changes.
    #
    # You can update Home Manager without changing this value. See
    # the Home Manager release notes for a list of state version
    # changes in each release.
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
      skate
      neovim
    ];
  };  
}
