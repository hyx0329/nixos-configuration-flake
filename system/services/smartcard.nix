{ config, pkgs, ... }:

{
  # required for some smartcard/pgp card implementations
  services.pcscd.enable = true;
}