{ config, lib, pkgs, ... }:

{
  fonts.fonts = with pkgs; [
    nerdfonts
    font-awesome
    wqy_zenhei
    wqy_microhei
  ];

  # link all fonts to /run/current-system/sw/share/X11/fonts
  fonts.fontDir.enable = true;
}
