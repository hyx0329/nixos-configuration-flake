{ config, pkgs, ... }:

{
  home.packages = (with pkgs.gnomeExtensions; [
    gsconnect
    note
    openweather
    tray-icons-reloaded
    keep-awake
    system-action-hibernate
  ]) ++ (with pkgs.gnome; [
    gnome-terminal
  ]) ++ (with pkgs; [
    papirus-icon-theme
  ]);
}

