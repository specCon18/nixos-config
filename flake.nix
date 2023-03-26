{
    description = "respec's nixos configs";

    inputs = {
        # For NixOS #
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-22.11";
        # NixOS Hardware Configuration for framework #
        nixos-hardware.url = "github:NixOS/nixos-hardware/master";
# For Wayfire #
#        nixpkgs-wayland  = { 
#            url = "github:nix-community/nixpkgs-wayland"; 
#            inputs.nixpkgs.follows = "nixpkgs";
#        };
        # For Home Manager #
        home-manager = {
            url = "github:nix-community/home-manager/release-22.11";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        # For Disko Disk Provisioning #
        disko = {
            url = "github:nix-community/disko";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        # For Secrets Management #
        sops-nix.url = github:Mic92/sops-nix;
    };

    outputs = { self, home-manager, nixos-hardware, disko, nixpkgs, sops-nix, ... }@inputs:
        let
            system = "x86_64-linux";
            pkgs = import nixpkgs {
                inherit system;
                config.allowUnfree = true;
            };

            defaultPackage.x86_64-linux = home-manager.defaultPackage.x86_64-linux;      
            defaultNixOptions = {
                nix.autoOptimiseStore = true;
            };
        mkComputer = configurationNix: userName: extraModules: extraHomeModules: inputs.nixpkgs.lib.nixosSystem {
            inherit system;
            specialArgs = { inherit system inputs pkgs nixos-hardware; };
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
                    home-manager.useGlobalPkgs = true;
                    home-manager.useUserPackages = true;
                    home-manager.users."${userName}" = {
                        imports = [ (./. + "/users/${userName}/home.nix") ] ++ extraHomeModules;
                    };
                }
            ] ++ extraModules;
        };
        in
        {
            nixosConfigurations = {
                creatorforge-vm = mkComputer
                    ./machines/proxmox-vm.nix #machine specific configuration
                    "speccon18" #default user
                    [
                        ./hosts/creatorforge.nix
                    ] #modules to load
                    []; #modules to be loaded by home-manager
                creatorforge-framework = mkComputer
                    ./machines/framework.nix #machine specific configuration
                    "speccon18"  #default user
                    [
                        nixos-hardware.nixosModules.framework-12th-gen-intel
                        disko.nixosModules.disko
                        ./hosts/creatorforge.nix
                    ] #modules to load
                    []; #modules to be loaded by home-manager
            };
            homeConfigurations = {
                speccon18 = home-manager.lib.homeManagerConfiguration {
                    pkgs = nixpkgs.legacyPackages.x86_64-linux;                
                    modules = [ ./.hm-modules/home-manager.nix];
                };
            };
        };
    
}