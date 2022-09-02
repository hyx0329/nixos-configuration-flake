{ config, libs, pkgs, ... }:

{
  home.packages = (with pkgs; [
    android-tools
  ]);
}
