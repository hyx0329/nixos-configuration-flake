{ config, pkgs, ... }:

{
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # enable smartcard usage
  hardware.gpgSmartcards.enable = true;

  # write udev rule for canokey
  services.udev.packages = [
    (pkgs.writeTextFile {
      name = "canokey-udev-rules";
      text = ''
        SUBSYSTEM!="usb", GOTO="canokeys_rules_end"
        ACTION!="add|change", GOTO="canokeys_rules_end"
        ATTRS{idVendor}=="20a0", ATTRS{idProduct}=="42d4", ENV{ID_SMARTCARD_READER}="1"
        LABEL="canokeys_rules_end"
        KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{idVendor}=="20a0", ATTRS{idProduct}=="42d4", TAG+="uaccess", GROUP="plugdev", MODE="0660"
        SUBSYSTEMS=="usb", ATTR{idVendor}=="20a0", ATTR{idProduct}=="42d4", MODE:="0666"
      '';
      destination = "/etc/udev/rules.d/69-canokeys.rules";
    })
  ];

  # use pcscd instead of gpg's internal scd
  services.pcscd.enable = true;

  # required environments
  environment.systemPackages = with pkgs; [ ccid ];
}
