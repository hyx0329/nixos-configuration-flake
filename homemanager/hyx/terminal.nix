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
      # theme = "fishy";
    };
  };
}