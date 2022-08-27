{
  packageOverrides = pkgs: with pkgs; {
    myVim = vim_configurable.customize {
      name = "vim-with-plugins";
      # add here code from the example section
    };
    myNeovim = neovim.override {
      configure = {
        customRC = ''
          # here your custom configuration goes!
        '';
        packages.myVimPackage = with pkgs.vimPlugins; {
          # see examples below how to use custom packages
          start = [ ];
          opt = [ ];
        }; 
      };     
    };
  };
}
