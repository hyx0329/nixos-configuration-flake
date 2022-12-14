{ config, libs, ... }:

{
  imports =
  [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./thinkfan.nix
    ./video-hardware-acceleration.nix
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  networking.hostName = "ISC-CAT4"; # Define your hostname.

  hardware.nvidia = {
    modesetting.enable = true;
    prime = {
      offload.enable = true;
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };
  # note GNOME uses Wayland, add xserver configs for compatibility
  services.xserver.videoDrivers = [ "nvidia" ];

  # binfmt, wonder why configurations laying here
  boot.binfmt.emulatedSystems = [
    "aarch64-linux"
    "riscv64-linux"
  ];

  # some fancy stuff
  boot.plymouth = {
    enable = true;
    theme = "bgrt";  # UEFI logo, if possible
    # logo = ./logo.png;  # specifiy a custom logo
  };
}

