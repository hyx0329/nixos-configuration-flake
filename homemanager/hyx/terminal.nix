{ config, pkgs, inputs, system, ... }:

{
  home.packages = with pkgs; [
    inputs.comma.packages.${system}.default
    ripgrep
    htop
    thefuck
  ];

  programs = {
    bat.enable = true;
    fzf.enable = true;
    bash.enable = true;  # this is required for HM to handle bash
  };

  programs.zsh = {
    enable = true;
    shellAliases = {
      ll = "ls -l";
    };
    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };
    oh-my-zsh = {
      enable = true;
      plugins = [
        "git" "thefuck"
        "gpg-agent"
        "history-substring-search"
        "systemd"
      ];
      theme = "fishy";
    };
  };

  # foot terminal config
  programs.foot = {
    enable = true;
    settings = {
      main = {
        term = "xterm-256color";
        dpi-aware = "yes";
      };
      mouse = {
        hide-when-typing = "yes";
      };
      colors = {
        # breeze color scheme
        # alpha=1.0
        foreground = "fcfcfc";
        background = "232627";
        
        ## Normal/regular colors (color palette 0-7)
        regular0 = "232627";  # black
        regular1 = "ed1515";  # red
        regular2 = "11d116";  # green
        regular3 = "f67400";  # yellow
        regular4 = "1d99f3";  # blue
        regular5 = "9b56b6";  # magenta
        regular6 = "1abc9c";  # cyan
        regular7 = "fcfcfc";  # white
        
        ## Bright colors (color palette 8-15)
        bright0 = "7f8c8d";   # bright black
        bright1 = "c0392b";   # bright red
        bright2 = "1cdc9a";   # bright green
        bright3 = "fdbc4b";   # bright yellow
        bright4 = "3daee9";   # bright blue
        bright5 = "8e44ad";   # bright magenta
        bright6 = "16a085";   # bright cyan
        bright7 = "ffffff";   # bright white
        
        ## dimmed colors (see foot.ini(5) man page)
        dim0 = "31363b";   # dim black
        dim1 = "783228";   # dim red
        dim2 = "17a262";   # dim green
        dim3 = "b65619";   # dim yellow
        dim4 = "1b668f";   # dim blue
        dim5 = "614a73";   # dim magenta
        dim6 = "186c60";   # dim cyan
        dim7 = "63686d";   # dim white
      };
    };
  };
  
}
