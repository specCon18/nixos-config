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
      enableSyntaxHighlighting = lib.mkDefault true;
      shellAliases = {
        ls = "exa -l";
        lsa = "exa -al";
        cd = "z";
        osrb = "sudo nixos-rebuild $1 --flake ~/code/nixos-config/#katana";
        top = "btm";
        cat = "bat --decorations=never";
      };
      localVariables = {
        EDITOR="hx";
        TERM="alacritty";
      };
    };
}