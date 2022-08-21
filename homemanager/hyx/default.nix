{ pkgs, ... }:

{
  # IDK why need this
  home.stateVersion = "22.11";

  # here are basic packages from repository
  home.packages = [ 
    # editor
    pkgs.vim
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

    # security
    pkgs.gnupg

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

    # other utilities
    pkgs.fsearch  # file searching
    pkgs.gnomeExtensions.gsconnect
    pkgs.gnomeExtensions.note
    pkgs.gnomeExtensions.openweather
    pkgs.gnomeExtensions.tray-icons-reloaded

  ];

  home.sessionVariables = {
    EDITOR = "vim";
  };  

  programs.bash = {
    enable = true
  };
}

