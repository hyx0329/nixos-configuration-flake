{ config, lib, pkgs, ... }:

let
  cfg = config.services.clashup;
  clashup_executable = builtins.fetchurl {
    url = "https://github.com/felinae98/clashup/raw/002852b8a6cd73fd7378b0f2c6feeca6f16962ad/clashup";
    sha256 = "8ace444678df0563cce6265cfdc7e22a69e41065600d0578d26fc937000b507c";
  };

in

{
  home.packages = with pkgs; [
    clash
  ];

  home.file.".local/bin/clashup".source = clashup_executable;
  home.file.".local/bin/clashup".executable = true;

  systemd.user.services.clashup = {
    Unit = {
      Description = "Update clash config file";
      Wants = "network-online.target";
      After = "network-online.target";
    };
    Service = {
      ExecStart = "${clashup_executable} --update";
      ExecStopPost = "/usr/bin/env systemctl --user restart clash";
      Type = "oneshot";
    };
  };

  systemd.user.timers.clashup = {
    Unit = {
      Description = "Update clash once a day";
      Wants = "network-online.target";
      After = "network-online.target";
    };
    Timer = {
      OnUnitActiveSec = "1d";
      RandomizedDelaySec = "100";
    };
    Install = {
      WantedBy = [ "timers.target" ];
    };
  };

  systemd.user.services.clash = {
    Unit = {
      Description = "A rule based proxy in Go.";
      After = "network.target";
    };
    Service = {
      Type = "simple";
      Restart = "always";
      ExecStart = "/etc/profiles/per-user/hyx/bin/clash";
    };
    Install = {
      WantedBy = [ "default.target" ];
    };
  };
}

