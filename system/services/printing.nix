{ config, pkgs, ... }:

{
  # Enable CUPS to print documents.
  services.printing.enable = true;
  services.printing.drivers = [
    pkgs.epson-escpr
    pkgs.epson-escpr2
  ];

  environment.systemPackages = [
    pkgs.ink  # read ink level
    pkgs.libinklevel  # interface (?)
  ];
}

