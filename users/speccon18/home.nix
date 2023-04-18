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
      just
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
        extract = "~/.config/zsh/extract.sh";
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
        theme = "monokai_pro_octagon";
        editor.line-number = "relative";
        editor.shell = ["zsh" "-c"];
      };
      themes = {
        monokai_pro_octagon = let
          red      = "#ff657a";
          orange   = "#ff9b5e";
          yellow   = "#ffd76d";
          green    = "#bad761";
          blue     = "#9cd1bb";
          purple   = "#c39ac9";
          base0    = "#161821";
          base1    = "#1e1f2b";
          base2    = "#282a3a";
          base3    = "#3a3d4b";
          base4    = "#535763";
          base5    = "#696d77";
          base6    = "#767b81";
          base7    = "#b2b9bd";
          base8    = "#eaf2f1";
          base8x0c = "#303342";
        in {
          "ui.linenr.selected" = { bg = base3; };
          "ui.text.focus" = { fg = yellow; modifiers = ["bold"]; };
          "ui.menu" = { fg = base8; bg = base3; };
          "ui.menu.selected" = { fg = base2; bg = yellow; };
          "ui.virtual.whitespace" = base5;
          "ui.virtual.ruler" = { bg = base1; };
          "info" = base8;
          "hint" = base8;
          "ui.background" = { bg = base2; };
          "ui.statusline.inactive" = { fg = base8; bg = base8x0c; };
          "ui.statusline" = { fg = base8; bg = base4; };
          "ui.statusline.normal" = { fg = base4; bg = blue; };
          "ui.statusline.insert" = { fg = base4; bg = green; };
          "ui.statusline.select" = { fg = base4; bg = purple; };
          "ui.popup" = { bg = base3; };
          "ui.window" = { bg = base3; };
          "ui.help" = { fg = base8; bg = base3; };
          "ui.selection" = { bg = base4; };
          "ui.cursor.match" = { bg = base4; };
          "ui.cursorline" = { bg = base1; };
          "comment" = { fg = base5; modifiers = ["italic"]; };
          "ui.linenr" = { fg = base5; };
          "ui.cursor.primary" = { fg = base7; modifiers = ["reversed"]; };
          "attribute" = blue;
          "variable" = base8;
          "constant" = orange;
          "variable.builtin" = red;
          "constant.builtin" = red;
          "namespace" = base8;
          "ui.text" = { fg = base8; };
          "punctuation" = base6;
          "type" = green;
          "type.builtin" = { fg = red; };
          "label" = base8;
          "constructor" = blue;
          "function" = green;
          "function.macro" = { fg = blue; };
          "function.builtin" = { fg = "cyan"; };
          "operator" = red;
          "variable.other.member" = base8;
          "keyword" = { fg = red; };
          "keyword.directive" = blue;
          "variable.parameter" = "#f59762";
          "error" = red;
          "special" = "#f59762";
          "module" = "#f59762";
          "warning" = "orange";
          "constant.character.escape" = { fg = base8; };
          "string" = yellow;
          "constant.numeric" = purple;
          "diff.plus" = green;
          "diff.delta" = "orange";
          "diff.minus" = red;
          "diagnostic.warning" = { underline = { color = "orange"; style = "curl"; }; };
          "diagnostic.error" = { underline = { color = red; style = "curl"; }; };
          "diagnostic.info" = { underline = { color = base8; style = "curl"; }; };
          "diagnostic.hint" = { underline = { color = base8; style = "curl"; }; };
          "markup.heading" = green;
          "markup.bold" = { fg = "orange"; modifiers = ["bold"]; };
          "markup.italic" = { fg = "orange"; modifiers = ["italic"]; };
          "markup.strikethrough" = { modifiers = ["crossed_out"]; };
          "markup.link.url" = { fg = "orange"; modifiers = ["underlined"]; };
          "markup.link.text" = yellow;
          "markup.quote" = green;
        };
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
