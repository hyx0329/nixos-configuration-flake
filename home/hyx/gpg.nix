{ config, pkgs, ... }:

{
  # security
  home.packages = [
    pkgs.gnupg  # normally bundled with system
  ];

  programs.gpg = {
    enable = true;
    scdaemonSettings = {
      disable-ccid = true;
      pcsc-shared = true;
    };
  };

  services.gpg-agent = {
    enable = true;
    enableExtraSocket = true;
    enableSshSupport = true;  # note the word case is different to system's
  };
}