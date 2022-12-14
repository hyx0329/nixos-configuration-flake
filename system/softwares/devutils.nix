{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # basic editor
    vimHugeX # default editor is nano(but modified elsewhere)

    # download tools
    wget
    curl
    aria2

    # dev utils
    git

    # system debug utils
    usbutils
    pciutils
    htop
    killall
    iproute
    inetutils

    # other useful tools
    tree

  ];
}
