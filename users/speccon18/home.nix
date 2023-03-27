{ pkgs, config, lib, ... }: {
#Home manager configuration
#imports = [ ./../../home ./../../home/nixos ];
  
  home = {
    username = "speccon18";
    homeDirectory = "/home/speccon18";
    stateVersion = "22.11";
    packages = with pkgs; [
      nushell
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
      rustup
      neofetch
      vlc
      remmina
      signal-desktop
      starship
      alacritty
      uutils-coreutils
    ];
  };


  programs = {
    nushell = {
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
    direnv = {
      enable = true;
      enableZshIntegration = lib.mkDefault true;
      #enableNushellIntegration = true;
    };
    home-manager = {
      enable = true;
    };
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
    git = {
      enable = true;
      userName = "specCon18";
      userEmail = "steven.carpenter@skdevstudios.com";
      # delta.enable = true;
      extraConfig = {
        init = {
          defaultBranch = "main";
        };
      };
    };
  };

  dconf.settings = {
    "org/gnome/mutter" = {
      experimental-features = [ "x11-randr-fractional-scaling" ];
    };
  };
}
