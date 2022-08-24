{ config, pkgs, ... }:

{
  imports = [
    ./terminal.nix
    ./gpg.nix
    ./vim
    ./gnome.nix
    ./softwares.nix
  ];

  home.sessionVariables = {
    QT_IM_MODULE = "fcitx";  # for QT applications with fcitx
    NIXOS_OZONE_WL = "1";    # enable wayland for Ozone
  };
}

