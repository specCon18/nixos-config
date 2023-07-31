{ config, pkgs, lib, ... }:

{
    services.openssh = lib.mkDefault {
        enable = true;
        openFirewall = true;
        startWhenNeeded = true;
        settings = {
            KexAlgorithms = [ "curve25519-sha256@libssh.org" ];
            PermitRootLogin = "no";
            PasswordAuthentication = false;
            KbdInteractiveAuthentication = false;
        };
    };
    security.pam = lib.mkDefault {
        enableSSHAgentAuth = true;
        services.sudo.sshAgentAuth = true;
    };
}