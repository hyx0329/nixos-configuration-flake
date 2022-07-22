{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # basic editor
    vim # default editor is nano

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
