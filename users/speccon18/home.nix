{ pkgs, config, lib, ... }:
{  
  home = {
    username = "speccon18";
    homeDirectory = "/home/speccon18";
    stateVersion = "22.11";
    packages = with pkgs; [
      mdbook
      w3m
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
      zellij
      zoxide
      remmina
      signal-desktop
      starship
      alacritty
      ncspot
      bacon
      bottom
      xplr
      broot
    ];
  };
  
  programs = {
    zoxide = {
      enable = true;
      enableZshIntegration = lib.mkDefault true;
#      enableNushellIntegration = false;
    };
    ncspot = {
      enable = true;
      package = pkgs.ncspot;
    };
    alacritty = {
      enable = true;
      settings = {
        window = {
          dimensions = {
            columns = 120;
            lines = 25;
          };
          decorations = "none";
          opacity = 0.8;
          title = "Alacritty";
        };
        font = {
          normal = {
            family = "SauceCodePro Nerd Font";
          };
          bold = {
            family = "SauceCodePro Nerd Font";
            style = "bold";
          };
          size = 12;
        };
        colors = {
          primary = {
            background = "#1d1f21";
            foreground = "#c5c8c6";
          };
          cursor = {
            text = "CellBackground";
            cursor = "CellForeground";
          };
            # Normal colors
          normal = {
            black = "#363537";
            red = "#FC618D";
            green = "#7BD88F";
            yellow = "#FCE566";
            blue = "#FD9353";
            magenta = "#948AE3";
            cyan = "#5AD4E6";
            white = "#F7F1FF";
          };

          # Bright colors
          bright = {
            black = "#69676C";
            red = "#FC618D";
            green = "#7BD88F";
            yellow = "#FCE566";
            blue = "#FD9353";
            magenta = "#948AE3";
            cyan = "#5AD4E6";
            white = "#F7F1FF";              
          };
        };
      };
    };
    zellij = {
      enable = true;
      package = pkgs.zellij;
    };
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
      enableAutosuggestions = lib.mkDefault true;
      enableCompletion = lib.mkDefault true;
      enableSyntaxHighlighting = lib.mkDefault true;
      shellAliases = {
        ls = "exa -l";
        lsa = "exa -al";
        cd = "z";
        osrb = "sudo nixos-rebuild $1 --flake ~/code/nix/nixos-config/#creatorforge-framework";
        zel = "zellij -s";
        ns = "nix-shell";
        top = "btm";
        hx = "hx";
        cat = "bat";
      };
      localVariables = {
        EDITOR="hx";
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
    helix = {
      enable = true;
      settings = {
        editor.line-number = "relative";
        editor.shell = ["zsh" "-c"];
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
          attach-modal-dialogs = true;
          dynamic-workspaces = true;
          edge-tiling = false;
          experimental-features = [ "scale-monitor-framebuffer" ];
          focus-change-on-pointer-rest = true;
          workspaces-only-on-primary = true;
      };
    };
  };
}
