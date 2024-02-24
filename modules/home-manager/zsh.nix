{ pkgs, config, lib, ...}:
{
  programs.zsh = {
      enable = lib.mkDefault true;
      dotDir = ".config/zsh";
      history = {
        path = "$ZDOTDIR/.zsh_history";
        save = 10000000;
      };
      enableAutosuggestions = lib.mkDefault true;
      enableCompletion = lib.mkDefault true;
      syntaxHighlighting.enable = lib.mkDefault true;
      shellAliases = {
        ls = "exa -l";
        lsa = "exa -al";
        grep = "rg";
        osrb = "sudo nixos-rebuild $1 --flake ~/code/nixos-config/#katana";
      };
      localVariables = {
        EDITOR="hx";
      };
    };
}