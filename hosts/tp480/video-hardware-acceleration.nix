{ config, pkgs, ... }:

{
  hardware.opengl = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver # LIBVA_DRIVER_NAME=iHD
      vaapiVdpau
      libvdpau-va-gl
      # vaapiIntel.override { enableHybridCodec = true; };  # LIBVA_DRIVER_NAME=i965 (older but works better for Firefox/Chromium)
      vaapiIntel  # the package is overided with an overlay in the root config
    ];
  };
}
