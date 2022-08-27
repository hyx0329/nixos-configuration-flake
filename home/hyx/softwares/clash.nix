{ config, lib, pkgs, ... }:

let
  cfg = config.services.clashup;
in

mkIf cfg.enable
{
  home.packages = with pkgs; [
    clash
  ];

  clashup_executable = fetchurl {
    url = "https://github.com/felinae98/clashup/raw/002852b8a6cd73fd7378b0f2c6feeca6f16962ad/clashup";
    sha256 = "8ace444678df0563cce6265cfdc7e22a69e41065600d0578d26fc937000b507c";
  };

  home.file.".local/bin/clashup".source = ${clashup_executable};

  lib.systemd.user.services.clashup = {
    Unit = {
      Description = "Update clash config file";
      Wants = "network-online.target";
      After = "network-online.target";
    };
    Service = {
      ExecStart = "${clashup_executable} --update";
      ExecStopPost = "/usr/bin/env systemctl --user restart clash";
      Type = "oneshot"
    };
  };

  lib.systemd.user.timers.clashup = {
    Unit = {
      Description = "Update clash once a day";
      Wants = "network-online.target";
      After = "network-online.target";
    };
    Timer = {
      OnUnitActiveSec = "1d";
    };
    Install = {
      WantedBy = "timers.target";
    };
  };

}

