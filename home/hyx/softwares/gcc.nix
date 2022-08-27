{ config, libs, pkgs, ... }:

{
  home.packages = with pkgs; [
    gcc
    #gcc-arm-embedded
    #gcc_multi
    gdb
  ];
}

