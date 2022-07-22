{ pkgs, ... }: {
  nix = {
    # install nix flakes system-wide
    package = pkgs.nixFlakes; # or versioned attributes like nixVersions.nix_2_8
    extraOptions = ''
      experimental-features = nix-command flakes
    '';

    # use a mirror
    settings.substituters = [ "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store" ];
   };
}
