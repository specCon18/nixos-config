{ pkgs, config, lib, ... }:
{  
  home = {
    username = "speccon18";
    homeDirectory = "/home/speccon18";
    stateVersion = "22.11";
    packages = with pkgs; [
      nushell
      bitwarden
      firefox
      discord
      nodejs-18_x
      spotify
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
      starship
      alacritty
    ];
  };

  programs = {
    nushell = {
      enable = false;
    };
    starship = {
      enable = true;
      enableZshIntegration = true;
      enableNushellIntegration = false;
    };
    zsh = {
      enable = lib.mkDefault true;
      dotDir = ".config/zsh";
      history = {
        path = "$ZDOTDIR/.zsh_history";
        save = 10000000;
      };
    };
    direnv = {
      enable = true;
      enableZshIntegration = lib.mkDefault true;
    };
    home-manager = {
      enable = true;
    };
    vscode = {
      enable = true;
      package = pkgs.vscode.fhs;
      enableExtensionUpdateCheck = true;
      enableUpdateCheck = false;
      extensions = with pkgs.vscode-extensions; [
        bbenoist.nix
        redhat.vscode-yaml
        bungcip.better-toml
        firefox-devtools.vscode-firefox-debug
        ms-vscode-remote.remote-ssh
        ms-azuretools.vscode-docker
        editorconfig.editorconfig
        dbaeumer.vscode-eslint
        donjayamanne.githistory
        github.copilot
        eamodio.gitlens
        graphql.vscode-graphql
        oderwat.indent-rainbow
        skellock.just
        jnoortheen.nix-ide
        christian-kohler.path-intellisense
        esbenp.prettier-vscode
        svelte.svelte-vscode
        bradlc.vscode-tailwindcss
        thenuprojectcontributors.vscode-nushell-lang
        matklad.rust-analyzer
      ];
      userSettings = {
        "workbench.colorTheme" = "Monokai Pro (Filter Octagon)";
        "workbench.startupEditor" = "none";
        "workbench.iconTheme" = "Monokai Pro Icons";
        "git.autofetch" = true;
        "redhat.telemetry.enabled" = false;
        "svelte.enable-ts-plugin" = true;
        "window.menuBarVisibility" = "compact";
        "prettier.singleQuote" = true;
        "prettier.useTabs" = true;
        "prettier.bracketSpacing" = false;
        "prettier.htmlWhitespaceSensitivity" = "strict";
        "typescript.updateImportsOnFileMove.enabled" = "always";
        "editor.fontFamily" = "OpenDyslexic, OpenDyslexic Mono NF";
        "rust-analyzer.inlayHints.chainingHints.enable" = false;
        "rust-analyzer.inlayHints.closingBraceHints.enable" = false;
        "rust-analyzer.inlayHints.renderColons" = false;
        "rust-analyzer.inlayHints.parameterHints.enable" = false;
        "editor.minimap.enabled" = false;
        "editor.inlineSuggest.enabled" = true;
        "window.zoomLevel" = 1;
      };
    };
    git = {
      enable = true;
      userName = "specCon18";
      userEmail = "steven.carpenter@skdevstudios.com";
      extraConfig = {
        init = {
          defaultBranch = "main";
        };
      };
    };
  };
  dconf = {
    enable = true;
    settings = {
      "org/gnome/mutter" = {
          experimental-features = [
            "x11-randr-fractional-scaling"
            "scale-monitor-framebuffer"
          ];
      };
    };
  };
}
