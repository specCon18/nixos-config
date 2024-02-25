{
config
, lib
, pkgs
}: 
let
  # To use this feature add -j0 to any nix commad.
  hostName = "bob.local";

in {
    nix = {
      distributedBuilds = true;
      settings = {
        trusted-public-keys = lib.mkAfter [
          # REMOTE MACHINE PUBLIC KEY WE GENERATE AFTER SETTING UP
        ];
        builders-use-substitutes = true;
        substituters = lib.mkAfter [
          "ssh-ng://nix-ssh@{hostname}"
        ];
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
            sshUser = "builder";
            sshKey = "/root/.ssh/id_ed25519";
            # publicHostKey = config.local.keys.gerg-desktop_fingerprint;
          }
        ];
    };
}