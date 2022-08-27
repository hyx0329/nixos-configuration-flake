{ config, lib, pkgs, modulesPath, nixos-hardware, ... }:

{
  imports =
    [
      (modulesPath + "/installer/scan/not-detected.nix")
      nixos-hardware.nixosModules.lenovo-thinkpad-t480
      nixos-hardware.nixosModules.common-pc-laptop-ssd # my specific setup
      nixos-hardware.nixosModules.common-cpu-intel-kaby-lake  # for i7 8550u ?
      nixos-hardware.nixosModules.common-gpu-intel
      nixos-hardware.nixosModules.common-gpu-nvidia
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "nvme" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];
  boot.loader.timeout = 1;  # 5s is too long

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/11631fc7-ad6a-47e9-861e-d2213294d95d";
      fsType = "ext4";
    };

  fileSystems."/boot/efi" =
    { device = "/dev/disk/by-uuid/F062-2F3D";
      fsType = "vfat";
    };

  # later use a separated home drive
  # fileSystems."/home" = 
  #   { device = "/dev/disk/by-uuid/cd134c28-58bc-4084-a783-b37e753bcc98";
  #     fsType = "ext4";
  #   };

  fileSystems."/home-old" = 
    { device = "/dev/disk/by-uuid/cd134c28-58bc-4084-a783-b37e753bcc98";
      fsType = "ext4";
      options = [ "defaults" "nofail" ];
    };

  swapDevices = [ { device = "/dev/disk/by-uuid/fd8f8d7a-4b1c-472d-a85a-61c7b1a2d9b3"; } ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp0s31f6.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp3s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";  # may not required with flakes
  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
