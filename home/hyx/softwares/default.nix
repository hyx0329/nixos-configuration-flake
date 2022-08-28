{ config, pkgs, ... }:

{

  imports = [
    ./build-utils.nix
    ./clash.nix
    ./python310.nix
  ];
 
  home.packages = with pkgs; [
    # terminal emulator
    foot
    alacritty

    # editor
    #vscodium  # fuck off, electron does not work well with wayland

    # browser
    firefox
    ungoogled-chromium  # also you, require addtional arguments to work

    # messaging
    thunderbird  # email
    tdesktop  # tg

    # archive tools
    unzip
    p7zip

    # downloader
    aria2
    curl
    wget

    # proxy
    # clash  # move to separated config
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
    calculix
    gmsh

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
    gimp-with-plugins  # drawing
    inkscape-with-extensions  # another drawing

    # user space driver
    # epson-escpr2  # move it to system package

    # dev utils
    arch-install-scripts

    # other utilities
    dig dnsutils traceroute
    expect
    file
    fsearch  # file searching
    gitFull
    podman
    s-tui
    libsForQt5.k3b
    brasero

  ];
}
