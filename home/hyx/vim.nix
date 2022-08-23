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
    extraConfig = 
"
let g:vim_markdown_folding_disabled = 1
";
    plugins = [
      pkgs.vimPlugins.vim-plug
      pkgs.vimPlugins.YouCompleteMe
      pkgs.vimPlugins.vim-markdown
    ];
  };
}
