{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.gnomeExtensions.gsconnect
    pkgs.gnomeExtensions.note
    pkgs.gnomeExtensions.openweather
    pkgs.gnomeExtensions.tray-icons-reloaded
  ];
}