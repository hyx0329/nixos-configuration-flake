{ config, libs, pkgs, ... }:

{
  home.packages = with pkgs; [
    cmake
    gcc
    #gcc-arm-embedded
    #gcc_multi
    gdb
  ];
}

