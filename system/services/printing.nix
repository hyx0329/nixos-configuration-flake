{ config, pkgs, ... }:

{
  # Enable CUPS to print documents.
  services.printing.enable = true;

  # add printer driver
  environment.systemPackages = [
    pkgs.epson-escpr2
  ];
}

