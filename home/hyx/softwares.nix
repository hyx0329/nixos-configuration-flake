{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # terminal emulator
    foot
    alacritty

    # editor
    vscodium  # fuck off, electron does not work well with wayland

    # browser
    firefox
    ungoogled-chromium  # also you, require addtional arguments to work

    # archive tools
    unzip
    p7zip

    # downloader
    aria2
    curl
    wget

    # proxy
    clash
    v2ray
    v2ray-geoip
    v2ray-domain-list-community

    # on-line services
    netease-cloud-music-gtk

    # gaming
    lutris
    osu-lazer

    # CAD
    freecad
    librecad
    kicad

    # media view & edit
    mpv  # audio & video
    picard  # audio meta
    libsForQt5.kdenlive  # clip edit
    libsForQt5.okular   # pdf
    audacity  # audio
    wpsoffice  # hmm somehow I need it
    libreoffice  # emm another office suite
    gnome.file-roller  # note I'm using gnome, this is archive viewer
    texlive.combined.scheme-full  # yep I need latex, still

    # user space driver
    epson-escpr2

    # dev utils
    arch-install-scripts
    gcc_multi
    gdb

    # other utilities
    expect
    file
    fsearch  # file searching
    gitFull
    podman
    s-tui

  ];
}
