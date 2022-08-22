{ config, pkgs, inputs, system, ... }:

{
  home.packages = with pkgs; [
    ripgrep
    htop
    inputs.comma.packages.${system}.default
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
        "zsh-history-substring-search"
      ];
      theme = "davevewer";
    };
  };
}