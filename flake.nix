{
    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-22.11";
        nixpkgs-wayland  = { 
            url = "github:nix-community/nixpkgs-wayland"; 
            inputs.nixpkgs.follows = "nixpkgs";
        };
        nixos-generators = {
            url = "github:nix-community/nixos-generators";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };
    outputs = { self, nixos-generators, nixpkgs, ... }@inputs:
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
                    ({pkgs, config, ...}:{
                        environment.systemPackages = with pkgs; [
                            inputs.nixpkgs-wayland.packages.${system}.wayfire-unstable
                        ];
                    })
                ];
            };
        };
    };
}