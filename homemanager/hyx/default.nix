{ config, pkgs, ... }:

{
  imports = [
    ./terminal.nix
    ./gpg.nix
    ./vim.nix
    ./gnome.nix
  ];

  # here are basic packages from repository
  home.packages = [ 
    # editor
    pkgs.vscodium

    # downloader
    pkgs.aria2
    pkgs.wget
    pkgs.curl

    # browser
    pkgs.firefox
    pkgs.ungoogled-chromium

    # archive tools
    pkgs.unzip
    pkgs.p7zip

    # proxy
    pkgs.clash
    pkgs.v2ray
    pkgs.v2ray-geoip
    pkgs.v2ray-domain-list-community

    # on-line services
    pkgs.netease-cloud-music-gtk

    # gaming
    pkgs.lutris
    pkgs.osu-lazer

    # CAD
    pkgs.freecad
    pkgs.librecad
    pkgs.kicad

    # media view & edit
    pkgs.mpv  # audio & video
    pkgs.picard  # audio meta
    pkgs.libsForQt5.kdenlive  # clip edit
    pkgs.libsForQt5.okular   # pdf
    pkgs.audacity  # audio
    pkgs.wpsoffice  # hmm somehow I need it
    pkgs.libreoffice  # emm another office suite
    pkgs.gnome.file-roller  # note I'm using gnome, this is archive viewer
    pkgs.texlive.combined.scheme-full  # yep I need latex, still

    # user space driver
    pkgs.epson-escpr2

    # other utilities
    pkgs.fsearch  # file searching
    pkgs.gitFull

  ];

  programs = {
    bash.enable = true;
    zsh.enable = true;  # this is required due to a HM bug
  };

  home.sessionVariables = {
    QT_IM_MODULE = "fcitx";  # for QT applications with fcitx
    NIXOS_OZONE_WL = "1";    # enable wayland for most applications
  };
}

