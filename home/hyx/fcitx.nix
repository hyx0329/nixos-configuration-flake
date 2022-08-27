{ config, pkgs, ... }:

{
  home.sessionVariables = {
    QT_IM_MODULE = "fcitx";  # for QT applications with fcitx
  };

  home.file.".local/share/fcitx5/themes/Material-Color".source =
    builtins.fetchTarball {
      url = "https://github.com/hosxy/Fcitx5-Material-Color/archive/refs/tags/0.2.1.tar.gz";
      # The sha256 value should be calculated through "nix-hash --type sha256 path/to/file"
      # There could be a problem where the encoding of the sums are different.
      sha256 = "615d0f30c8ede30aacbe542dd6b09b6d308d50a79172380dfdf9ba1d1c6407c6";
    };

}
  
