{
    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-22.11";
        nixos-hardware.url = "github:NixOS/nixos-hardware/master";
# For Wayfire #
#        nixpkgs-wayland  = { 
#            url = "github:nix-community/nixpkgs-wayland"; 
#            inputs.nixpkgs.follows = "nixpkgs";
#        };
        home-manager = {
            url = "github:nix-community/home-manager/release-22.11";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        nixos-generators = {
            url = "github:nix-community/nixos-generators";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        disko = {
            url = "github:nix-community/disko";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };
    outputs = { self, home-manager, nixos-generators, nixos-hardware, disko, nixpkgs, ... }@inputs:
    {
        defaultPackage.x86_64-linux = home-manager.defaultPackage.x86_64-linux;
    
        proxmox = nixos-generators.nixosGenerate {
            system = "x86_64-linux";
            modules = [
                ./hosts/creatorforge.nix
            ];
            format = "proxmox";
        };
        nixosConfigurations = {
            creatorforge-vm = nixpkgs.lib.nixosSystem {
                system = "x86_64-linux";
                modules = [
                    ./hosts/creatorforge.nix
                    ./.modules/base/proxmox-vm-hardware.nix
                ];
            };
            creatorforge-framework = nixpkgs.lib.nixosSystem {
                system = "x86_64-linux";
                modules = [
                    nixos-hardware.nixosModules.framework-12th-gen-intel
                    disko.nixosModules.disko
                    ./hosts/creatorforge.nix
                    ./.modules/base/framework.nix
                ];
            };
        };
        homeConfigurations = {
            speccon18 = home-manager.lib.homeManagerConfiguration {
                modules = [ ./hm-modules/home-manager.nix];
                # username = "speccon18";
                # homeDirectory = "/home/speccon18";
                # configuration = {
                #     imports = [
                #         ./.hm-modules/home-manager.nix
                #     ];
                # };
            };
        };
    };
    
}