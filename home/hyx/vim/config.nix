let
  custom_rc = ''
    set nocompatible
    set hidden
    set colorcolumn=80
    syntax enable
    set mouse=a
    set visualbell
    set number
    set expandtab
    set tabstop=2
    set softtabstop=2
    set shiftwidth=2
    set modeline
    filetype plugin indent on
    
  '';
in
{
  packageOverrides = pkgs: with pkgs; {
    myVim = vim_configurable.customize {
      name = "vim-with-plugins";
      # add here code from the example section
      vimrcConfig.customRC = custom_rc;
      vimrcConfig.plug.plugins = with pkgs.vimPlugins; [
        vim-addon-nix
        youcompleteme
        auto-pairs
        tabular
        rust-vim
        vim-markdown
        ale
        vimspector
        fugitive
      ];
    };
  };
}

