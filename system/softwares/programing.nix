{ config, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    python3Full
    vscodium
  ];
}
