{ config, pkgs, ... }:

{
  # only lock computer on lid close when plugged
  services.logind.lidSwitchExternalPower = "lock";
}
