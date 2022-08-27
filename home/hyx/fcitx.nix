{ config, pkgs, ... }:

{
  home.sessionVariables = {
    QT_IM_MODULE = "fcitx";  # for QT applications with fcitx
  };

  home.file.".local/share/fcitx5/themes/Material-Color/theme.conf".source =
    builtins.fetchurl {
      url = "https://github.com/hosxy/Fcitx5-Material-Color/raw/2256feeae48dcc87f19a3cfe98f171862f8fcace/theme-teal.conf";
      sha256 = "1ac4702dff31df82d75b9395c804e07e9df628d39d40d44bc82a2f89b5a5a48a";
    };

}
  
