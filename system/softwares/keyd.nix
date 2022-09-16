{ config, pkgs, ... }:

{
  # keyd from unstable
  environment.systemPackages = with pkgs; [ keyd ];

  # keyd group for extra config
  users.groups.keyd = {};

  # system service
  systemd.services.keyd = {
    description = "key remapping daemon";
    requires = [ "local-fs.target" ];
    after = [ "local-fs.target" ];
    wantedBy = [ "sysinit.target" ];
    serviceConfig = {
      ExecStart = "${pkgs.keyd}/bin/keyd";
      # Restart = "on-failure";
      Type = "simple";
    };
  };

  # configuration
  environment.etc."keyd/default.conf".text = ''
    [ids]

    *

    [main]

    # seems bugged: double tap esc will cause cmd print a sudo prompt
    # capslock = esc
    capslock = layer(control)
    d = timeout(d, 200, layer(dnav))
    leftshift = layer(shift)

    [control:C]
    d = C-d

    [shift:S]
    capslock = capslock
    d = S-d

    [dnav:]
    h = left
    j = down
    k = up
    l = right
    u = pageup
    n = pagedown
    y = home
    m = end
    p = S-insert
    [ = C-[

  '';
}
