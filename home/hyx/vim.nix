{ config, pkgs, ... }:

{
  # This will cause config file collision
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
      tabsize = 2;
    };
    extraConfig = 
"
let g:vim_markdown_folding_disabled = 1
";
    plugins = [
      pkgs.vimPlugins.vim-plug
      # I decide to only keep vim-plug for the moment
      #pkgs.vimPlugins.YouCompleteMe
      #pkgs.vimPlugins.vim-markdown
    ];
  };
}
