{ config, libs, pkgs, ... }:

{
  home.packages = (with pkgs; [
    python310
  ]) ++ (with pkgs.python310Packages; [
    python-daemon
    requests
  ]);
}
