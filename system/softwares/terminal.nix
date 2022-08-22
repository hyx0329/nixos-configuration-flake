{ config, pkgs, ... }:

{
  # It seems I need these to make env vars work
  # programs.bash.enable = true;  # has no effect now, need removal
  programs.zsh.enable = true;
}