{ config, lib, pkgs, ... }:

{
  fonts.fonts = with pkgs; [
    nerdfonts
    font-awesome
    font-awesome_5
    font-awesome_4
    wqy_zenhei
    wqy_microhei
    #vistafonts
    carlito  # calibri compatible
  ];

  # link all fonts to /run/current-system/sw/share/X11/fonts
  fonts.fontDir.enable = true;
}
