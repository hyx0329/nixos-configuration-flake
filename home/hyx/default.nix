{ config, pkgs, ... }:

{
  imports = [
    ./terminal.nix
    ./gpg.nix
    ./vim
    ./gnome.nix
    ./fcitx.nix
    ./softwares
  ];

  home.sessionVariables = {
    NIXOS_OZONE_WL = "1";    # enable wayland for Ozone
    PATH = ''''${HOME}/.local/bin:''${PATH}'';
  };

  # TODO: link font folder

  ## programs ##
  programs.mpv = {
    enable = true;
    config = {
      hwdec = "auto-safe";
      vo = "gpu";
      profile = "gpu-hq";
      gpu-context = "wayland";
    };
  };
}

