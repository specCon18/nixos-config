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
      package = pkgs.vscode.fhs;
      enableExtensionUpdateCheck = true;
      enableUpdateCheck = false;
      extensions = [
#        "tlahmann.alex-linter"
#        "astro-build.astro-vscode"
#        "aaron-bond.better-comments"
#        "bungcip.better-toml"
#        "antfu.browse-lite"
#        "firefox-devtools.vscode-firefox-debug"
#        "ms-vscode-remote.remote-containers"
#        "ms-azuretools.vscode-docker"
#        "editorconfig.editorconfig"
#        "dbaeumer.vscode-eslint"
#        "donjayamanne.githistory"
#        "felipecaputo.git-project-manager"
#        "github.copilot"
#        "eamodio.gitlens"
#        "graphql.vscode-graphql"
#        "graphql.vscode-graphql-syntax"
#        "oderwat.indent-rainbow"
#        "skellock.just"
#        "monokai.theme-monokai-pro-vscode"
#        "bbenoist.nix"
#        "jnoortheen.nix-ide"
#        "christian-kohler.path-intellisense"
#        "csstools.postcss"
#        "esbenp.prettier-vscode"
#        "ms-vscode-remote.remote-ssh"
#        "ms-vscode-remote.remote-ssh-edit"
#        "ms-vscode.remote-server"
#        "ms-vscode-remote.vscode-remote-extensionpack"
#        "ms-vscode.remote-explorer"
#        "rust-lang.rust-analyzer"
#        "rhalaly.scope-to-this"
#        "svelte.svelte-vscode"
#        "bradlc.vscode-tailwindcss"
#        "tauri-apps.tauri-vscode"
#        "antfu.vite"
#        "zixuanchen.vitest-explorer"
#        "vscode-icons-team.vscode-icons"
#        "thenuprojectcontributors.vscode-nushell-lang"
#        "ms-vscode-remote.remote-wsl"
#        "redhat.vscode-yaml"
    ];
    };
    #TODO: Generate and add configs for this
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
