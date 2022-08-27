{ config, pkgs, ... }:

{
  home.sessionVariables = {
    QT_IM_MODULE = "fcitx";  # for QT applications with fcitx
  };

  home.file.".local/share/fcitx5/themes/Material-Color".source =
    builtins.fetchTarball {
      url = "https://github.com/hosxy/Fcitx5-Material-Color/archive/refs/tags/0.2.1.tar.gz";
      sha256 = "eeee748f47a645f2ba6f12258bd7c2a90016f842a8896511d88af42588d30594";
    };

}
  
