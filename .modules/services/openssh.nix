_: { config, pkgs, lib, ... }:

{
    services.openssh = {
        enable = true;
        openFirewall = true;
        startWhenNeeded = true;
        kexAlgorithms = [ "curve25519-sha256@libssh.org" ];
        passwordAuthentication = false;
        kbdInteractiveAuthentication = false;
        permitRootLogin = "no";
    };
    security.pam = mkDefault{
        enableSSHAgentAuth = true;
        services.sudo.sshAgentAuth = true;
    };
}