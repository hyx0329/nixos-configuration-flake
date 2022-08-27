{ config, pkgs, ... }:

{
  home.sessionVariables = {
    QT_IM_MODULE = "fcitx";  # for QT applications with fcitx
  };

  home.file.".local/share/fcitx5/themes/Material-Color".source =
    builtins.fetchTarball {
      url = "https://github.com/hosxy/Fcitx5-Material-Color/archive/refs/tags/0.2.1.tar.gz";
      # The sha256 value should be calculated through "nix-hash --type sha256 path/to/file"
      # The sum is calculated AFTER the extraction.
      # There could be a problem where the encoding of the sums are different.
      sha256 = "8bd247209f9c1cb4c16543738fd5239772c87640a59535a93b54dae0e4f52d37";
    };

}
  
