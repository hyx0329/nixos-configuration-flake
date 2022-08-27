{ config, pkgs, ...}:

{
  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant. Conflict the NM.

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  networking.firewall.allowedTCPPortRanges = [
    {
      from = 1001;
      to = 39999;
    }
  ]; 

  networking.firewall.allowedUDPPortRanges = [
    {
      from = 1001;
      to = 39999;
    }
  ]; 

  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # network discovery
  services.avahi = {
    enable = true;
    nssmdns = true;
    # reflector = true;
  };
}
