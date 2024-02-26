{
config
, lib
, pkgs
, ...
}: 
let
  # To use this feature add -j0 to any nix commad.
  hostName = "10.18.1.60";
  pubKey = "bob:cday7vAQb+UWE1gQOAOjqnXB8EdjkBt+/Ife/R0ylUY=";
in {
    nix = {
      distributedBuilds = true;
      settings = {
        trusted-public-keys = lib.mkAfter [
          pubKey
        ];
        builders-use-substitutes = true;
        # substituters = lib.mkAfter [
        #   "ssh-ng://nix-ssh@${hostname}"
        # ];
        # allowed-users = [
        #   "@wheel"
        #   "@builders"
        # ];
        # trusted-users = [
        #   "root"
        #   "nix-ssh"
        # ];
      };
      buildMachines = [
          {
            inherit hostName;
            protocol = "ssh-ng";
            maxJobs = 8;
            systems = [
              "x86_64-linux"
              "i686-linux"
            ];
            supportedFeatures = [
              "big-parallel"
              "nixos-test"
              "kvm"
              "benchmark"
            ];
            sshUser = "root";
            sshKey = "/root/.ssh/id_ed25519";
            # publicHostKey = 
          }
        ];
    };
}