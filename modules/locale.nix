{ config, pkgs, ... }: {
  # Set your time zone.
  time.timeZone = "Asia/Shanghai";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.utf8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "zh_CN.utf8";
    LC_IDENTIFICATION = "zh_CN.utf8";
    LC_MEASUREMENT = "zh_CN.utf8";
    LC_MONETARY = "zh_CN.utf8";
    LC_NAME = "zh_CN.utf8";
    LC_NUMERIC = "zh_CN.utf8";
    LC_PAPER = "zh_CN.utf8";
    LC_TELEPHONE = "zh_CN.utf8";
    LC_TIME = "zh_CN.utf8";
  };

  # input method
  i18n.inputMethod.enabled = "fcitx5";
  i18n.inputMethod.fcitx5.addons = with pkgs; [
    fcitx5-configtool
    fcitx5-chinese-addons
    fcitx5-lua
    fcitx5-mozc
  ];
  environment.systemPackages = with pkgs; [
    lua # required by fcitx5-lua
  ];

  # fonts
  environment.systemPackages = with pkgs; [
    wqy_microhei;
  ];
}
