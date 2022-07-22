{
  description = "Hyx's NixOS config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-22.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-hardware.url = github:NixOS/nixos-hardware/master;
    nur.url = "github:nix-community/NUR";

    #home-manager = {
    #  url = "github:nix-community/home-manager";
    #  inputs.nixpkgs.follows = "nixpkgs";
    #};
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    nixpkgs-unstable,
    nixos-hardware,
    nur,
    #home-manager,
    ...
  }: {

    nixosConfigurations.tp480 = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      system = "x86_64-linux";
      modules = [
        {
          nixpkgs.overlays = [
            nur.overlay
            #(import ./overlays)
          ];
        }

        # hardware configs
        nixos-hardware.nixosModules.common-pc-laptop-ssd
        nixos-hardware.nixosModules.lenovo-thinkpad-t480
        nixos-hardware.nixosModules.common-cpu-intel-kaby-lake  # for i7 8550u ?
        nixos-hardware.nixosModules.common-gpu-intel
        nixos-hardware.nixosModules.common-gpu-nvidia
        ./hosts/tp480  # customized platform config including hardware, user profiles, blablabla
        ./modules/desktop/gnome.nix  # gnome4 looks cool
        ./modules/locale.nix  # IM, font, etc.
        ./modules/network.nix
        ./modules/services
        ./modules/softwares
        ./modules/release-configs.nix

        # home-manager integration
        #home-manager.nixosModules.home-manager
        #{
        #  home-manager.useGlobalPkgs = true;
        #  home-manager.useUserPackages = true;
        # Make sure the user names are correct
        #  # home-manager.users.username = import ./homemanager/home-username.nix;
        #  home-manager.users.hyx = import ./homemanager/home-hyx.nix;
        #}
      ];
    };

    packages.x86_64-linux.hello = nixpkgs.legacyPackages.x86_64-linux.hello;

    defaultPackage.x86_64-linux = self.packages.x86_64-linux.hello;

  };
}
