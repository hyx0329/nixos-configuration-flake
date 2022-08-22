{
  description = "Hyx's NixOS config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable-small";
    nixos-hardware.url = github:NixOS/nixos-hardware/master;
    nur.url = "github:nix-community/NUR";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    comma.url = "github:nix-community/comma";
    comma.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    self,
    nixpkgs,
    nixos-hardware,
    nur,
    home-manager,
    ...
  } @ inputs: 
  # currently I only have one laptop so no "let...in" required
  # but added for future convenience
  let
    overlayModule = {
      nixpkgs.overlays = [
        (nur.overlay)
        #(import ./overlays)
      ];
    };
    userName = "hyx";
  in
  {
    nixosConfigurations.tp480 = nixpkgs.lib.nixosSystem {
      specialArgs = inputs;
      system = "x86_64-linux";
      modules = [
        overlayModule                 # global overlay module
        ./hosts/tp480                 # customized platform config for hardware
        ./system/release-configs.nix  # allow non-free, pin stateVersion
        ./system/users/hyx.nix        # my account config, don't forget to set passwd
        ./system/desktop/gnome.nix    # gnome4 looks cool
        ./system/locale.nix           # IM, font, etc.
        ./system/network.nix          # network manager and default configs
        ./system/services             # power, bluetooth, audio, printing
        ./system/softwares            # include nix configs

        # home-manager integration
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.${userName} = import ./homemanager/${userName};
          home.stateVersion = "22.11";
        }
      ];
    };
  };
}
