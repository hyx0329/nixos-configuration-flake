{ config, lib, pkgs, ... }:

{
  fonts.fonts = with pkgs; [
    nerdfonts
    font-awesome
    wqy_zenhei
    wqy_microhei
  ];
}
