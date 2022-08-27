{ config, pkgs, ... }:

{
  (pkgs.callPackage ./config.nix {
    vim_configurable = vim_configuable.override { python = python3; };
   })

  # This will conflict with homemanager's config below
  # home manager's vim configuration tool sucks anyway
  #home.packages = [
  #  pkgs.vim
  #];

  home.sessionVariables = {
    EDITOR = "vim";
  };

  # seems broken, not working, disabled
  #programs.vim = {
  #  enable = true;
  #  settings = {
  #    expandtab = true;
  #    tabstop = 2;
  #    number = true;
  #  };
  #  extraConfig = ''
  #    let g:vim_markdown_folding_disabled = 1
  #  '';
  #  plugins = with pkgs.vimPlugins; [
  #    vim-plug
  #    YouCompleteMe
  #    vim-markdown
  #  ];
  #};

  # manual configuation
  home.file.".vimrc".source = ./vimrc;
  #home.file.".vim/autoload/plug.vim".source = ./plug.vim;


  # somehow the code below will not work after a garbage collection
  home.file.".vim/autoload/plug.vim".source = builtins.fetchurl {
    # pure, but may not be the latest
    url = "https://github.com/junegunn/vim-plug/raw/d94d234548a8fd6fa686812848f377f1419dafa1/plug.vim";
    sha256 = "e2dbd7c8d732ae797e5059c0dc1e964b94529a32d07d051d5d058727462a43fd";
  };
}
