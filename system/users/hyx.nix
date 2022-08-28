{ config, pkgs, ... }: {
  # users with their own groups, I think
  users.groups = {
    hyx = { gid = 1000; };
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.hyx = {
    isNormalUser = true;
    description = "hyx";
    group = "hyx";
    extraGroups = [ 
      "networkmanager"
      "wheel" "adm" 
      "uucp" "users"
      "audio" "video"
      "floppy" "lp" "cdrom"
    ];
    packages = with pkgs; [
      # Note: packages here will interfere with home manager
      #web browser
      #firefox
      #ungoogled-chromium
      # some proxy tools
      #clash
      #v2ray
      #v2ray-domain-list-community
      #v2ray-geoip
      # basic utilities
      #curl
      #wget
      #git
      #vim
    ];
  };

  # use zsh as default shell
  users.users.hyx.shell = pkgs.zsh;
}
