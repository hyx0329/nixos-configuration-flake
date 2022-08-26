{ config, libs, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    qemu_full
    qemu-utils
    proot
  ];
}

