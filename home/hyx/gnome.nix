{ config, pkgs, ... }:

{
  home.packages = (with pkgs.gnomeExtensions; [
    note
    openweather
    tray-icons-reloaded
    keep-awake
    system-action-hibernate
  ]) ++ (with pkgs.gnome; [
    gnome-terminal
    gnome-tweaks
  ]) ++ (with pkgs; [
    papirus-icon-theme
  ]);

  # GSConnect is configured system-wide
}

