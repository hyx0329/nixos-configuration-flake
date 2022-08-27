{ config, lib, pkgs, ... }:

let
  myVimPkg = (import ./config-prog-only.nix).packageOverrides pkgs;
  vim_configured = lib.overrideDerivation myVimPkg.myVim (o: {
        ftNixSupport = true;
        pythonSupport = true;
        luaSupport = true;
        tclSupport = true;
        cscopeSupport = true;
        multibyteSupport = true;
        mzschemeSupport = true;
      });
in

{

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  home.packages = [
    #vim_configured
    pkgs.vimHugeX
  ];

  # seems broken, not working
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
  #    vim-addon-nix
  #    YouCompleteMe
  #    auto-pairs
  #    tabular
  #    vim-markdown
  #    vimspector
  #    fugitive
  #    ale
  #    rust-vim
  #  ];
  #};

  # manual configuation
  home.file.".vimrc".source = ./vimrc;
  #home.file.".vim/autoload/plug.vim".source = ./plug.vim;

  home.file.".vim/autoload/plug.vim".source = builtins.fetchurl {
    # pure, but may not be the latest
    url = "https://github.com/junegunn/vim-plug/raw/d94d234548a8fd6fa686812848f377f1419dafa1/plug.vim";
    sha256 = "e2dbd7c8d732ae797e5059c0dc1e964b94529a32d07d051d5d058727462a43fd";
  };
}
