{ config, pkgs, ... }: {
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.hyx = {
    isNormalUser = true;
    description = "hyx";
    extraGroups = [ 
      "networkmanager"
      "wheel" "adm" 
      "uucp" "users"
      "audio" "video"
      "floppy" "lp" "cdrom"
    ];
    packages = with pkgs; [
      # web browser
      firefox
      ungoogled-chromium
      # some proxy tools
      clash
      v2ray
      v2ray-domain-list-community
      v2ray-geoip
    ];
  };
}
