{
    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-22.11";
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
    };
    outputs = { self, home-manager, nixos-generators, flake-utils, nixpkgs, ... }@inputs:
    {
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
        };
        homeManagerConfiguration = {
            speccon18 = {
                username = "speccon18";
                homeDirectory = "/home/speccon18";
                configuration = {
                    imports = [
                        ./.hm-modules/home-manager.nix
                    ];
                };
            };
        };
    };
}