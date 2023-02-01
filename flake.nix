{
    inputs = {
        nixpkgs-small.url = "github:NixOS/nixpkgs/nixos-22.11";
        nixos-generators = {
            url = "github:nix-community/nixos-generators";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };
    outputs = { self, nixos-generators, nixpkgs, ... }@inputs:
    {
        example = nixos-generators.nixosGenerate {
            system = "x86_64-linux";
            modules = [
                ./hosts/example.nix
            ];
            format = "virtualbox";
        };
        
    };
}