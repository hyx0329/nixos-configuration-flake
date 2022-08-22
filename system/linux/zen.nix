{ config, pkgs, ... }:

{
  # use linux-zen
  boot.kernelPackages = pkgs.linuxPackages_zen;
}
