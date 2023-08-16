{
    description = "respec's nixos configs";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.05";
        nixos-hardware.url = "github:NixOS/nixos-hardware/master";
        sops-nix.url = github:Mic92/sops-nix;
        devenv.url = "github:cachix/devenv/latest";
        hyprland.url = "github:hyprwm/Hyprland";
        xdph.url = "github:hyprwm/xdg-desktop-portal-hyprland";
        home-manager = {
            url = "github:nix-community/home-manager/release-23.05";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        disko = {
            url = "github:nix-community/disko";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = { self, home-manager, nixos-hardware, disko, nixpkgs, sops-nix, devenv, hyprland, xdph, ... }@inputs:
        let
            system = "x86_64-linux";
            pkgs = import nixpkgs {
                inherit system;
                config.allowUnfree = true;
            };
            defaultPackage.system = home-manager.defaultPackage.x86_64-linux;
            defaultNixOptions = {
                nix.settings.auto-optimise-store = true;
            };
        mkComputer = configurationNix: userName: extraModules: extraHomeModules: inputs.nixpkgs.lib.nixosSystem {
            inherit system;
            specialArgs = { inherit system inputs self pkgs nixos-hardware; };
            modules = [
                #Secrets management
                sops-nix.nixosModules.sops
                #Machine config
                configurationNix
                defaultNixOptions

                #User config
                (./. + "/users/${userName}")

                #Home manager
                home-manager.nixosModules.home-manager
                {
                    home-manager = {
                        useGlobalPkgs = true;
                        useUserPackages = true;
                        users."${userName}" = {
                            imports = [ (./. + "/users/${userName}/home.nix") ] ++ extraHomeModules;
                        };
                    };
                    
                }
            ] ++ extraModules;
        };
        in
        {
            nixosConfigurations = {
                katana = mkComputer
                    ./machines/katana.nix #machine specific configuration
                    "speccon18"  #default user
                    [
                        hyprland.nixosModules.default
                        ./modules/system/desktop-environments/hyprland.nix
                        ./hosts/katana/default.nix
                        ./hosts/katana/networkd.nix
                        ./hosts/katana/system-pkgs.nix
                        ./modules/system/services/docker.nix
                        ./modules/system/services/openssh.nix
                        ./modules/system/desktop-environments/gnome.nix
                        ./modules/system/services/syncthing.nix
                        ./modules/system/services/tailscale.nix
                        
                    ] #extra modules to be loaded
                    [
                        hyprland.homeManagerModules.default
                        ./modules/home-manager/hyprland.nix
                        ./modules/home-manager/helix.nix
                        ./modules/home-manager/alacritty.nix
                        ./modules/home-manager/vscode.nix
                        ./modules/home-manager/zsh.nix
                        ./modules/home-manager/git.nix
                        ./modules/home-manager/zoxide.nix
                        ./modules/home-manager/ncspot.nix
                        ./modules/home-manager/zellij.nix
                        ./modules/home-manager/nushell.nix
                        ./modules/home-manager/direnv.nix
                        ./modules/home-manager/home-manager.nix
                        ./modules/home-manager/starship.nix
                        ./modules/home-manager/dconf-settings.nix
                        ./modules/home-manager/syncthing.nix
                    ]; #extra modules to be loaded by home-manager
            };
        };

}