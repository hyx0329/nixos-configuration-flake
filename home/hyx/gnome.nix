{ config, pkgs, ... }:

{
  home.packages = (with pkgs.gnomeExtensions; [
    note
    openweather
    tray-icons-reloaded
    caffeine # auto disable screensaver plus a button
    system-action-hibernate
    sound-output-device-chooser
  ]) ++ (with pkgs.gnome; [
    gnome-terminal
    gnome-tweaks
    nautilus-python
  ]) ++ (with pkgs; [
    papirus-icon-theme
  ]);

  # GSConnect is configured system-wide
}

