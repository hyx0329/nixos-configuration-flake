{
  description = "Hyx's NixOS config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable-small";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable-small";
    nixos-hardware.url = github:NixOS/nixos-hardware/master;
    nur.url = "github:nix-community/NUR";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-unstable,
    nixos-hardware,
    nur,
    home-manager,
    ...
  } @ attrs: {

    nixosConfigurations.tp480 = nixpkgs.lib.nixosSystem {
      specialArgs = attrs;
      system = "x86_64-linux";
      modules = [
        {
          nixpkgs.overlays = [
            nur.overlay
            #(import ./overlays)
          ];
        }

        # hardware configs
        ./hosts/tp480  # customized platform config for hardware
        ./modules/release-configs.nix
	./modules/users/hyx.nix  # my account config, don't forget to set passwd
        ./modules/desktop/gnome.nix  # gnome4 looks cool
        ./modules/locale.nix  # IM, font, etc.
        ./modules/network.nix
        ./modules/services
        ./modules/softwares  # include nix configs

        # home-manager integration
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          # Make sure the user names are correct
          # home-manager.users.username = import ./homemanager/home-username.nix;
          home-manager.users.hyx = import ./homemanager/hyx.nix;
        }
      ];
    };

    packages.x86_64-linux.hello = nixpkgs.legacyPackages.x86_64-linux.hello;

    defaultPackage.x86_64-linux = self.packages.x86_64-linux.hello;

  };
}
