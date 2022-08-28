{ config, libs, pkgs, ... }:

{
  home.packages = with pkgs; [
    #cmake
    gnumake
    gcc
    #gcc-arm-embedded
    #gcc_multi
    gdb
  ];
}

