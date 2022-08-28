{ config, pkgs, ... }:

{
  # use latest vanilla linux
  boot.kernelPackages = pkgs.linuxPackages_latest;
}
