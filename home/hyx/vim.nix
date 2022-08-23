{ config, pkgs, ... }:

{
  # This will conflict with homemanager's config below
  #home.packages = [
  #  pkgs.vim
  #];
  
  home.sessionVariables = {
    EDITOR = "vim";
  };

  programs.vim = {
    enable = true;
    settings = {
      expandtab = true;
      tabstop = 2;
      number = true;
    };
    extraConfig = ''
      let g:vim_markdown_folding_disabled = 1
    '';
    plugins = with pkgs.vimPlugins; [
      vim-plug
      YouCompleteMe
      vim-markdown
    ];
  };
}
