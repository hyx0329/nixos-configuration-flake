{ config, pkgs, ... }:

{
  # These are actually default values
  services.upower = {
    usePercentageForPolicy = true;
    criticalPowerAction = "HybridSleep";
  };
}
