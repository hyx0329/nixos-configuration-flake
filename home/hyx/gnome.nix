{ config, pkgs, ... }:

{
  home.packages = (with pkgs.gnomeExtensions; [
    note
    openweather
    tray-icons-reloaded
    keep-awake
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

