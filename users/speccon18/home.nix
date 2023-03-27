{ pkgs, config, lib, ... }: {  
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
      ];
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

  dconf.settings = {
    "org/gnome/mutter" = {
      experimental-features = [ "x11-randr-fractional-scaling" "scale-monitor-framebuffer" ];
    };
  };
}
