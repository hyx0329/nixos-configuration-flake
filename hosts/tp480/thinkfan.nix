{ config, lib, pkgs, ... }:

{
  services.thinkfan = {
    enable = true;
    #levels = [
    #  #[0 0 55]
    #  ["level auto" 0 75]
    #  ["level disengaged" 70 255]
    #]
  };
}

