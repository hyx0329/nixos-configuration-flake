{ pkgs, ... }:

{
  # IDK why need this
  home.stateVersion = "22.11";

  home.packages = [ 
    pkgs.jdk8
  ];
}

