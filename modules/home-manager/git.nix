{ pkgs, config, lib, ...}:
{
  programs.git = {
    enable = true;
    userName = "specCon18";
    userEmail = "steven.carpenter@skdevstudios.com";
    extraConfig = {
      init = {
        defaultBranch = "main";
      };
    };
  };
}