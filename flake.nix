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
    userName = "hyx";
  in
  {
    nixosConfigurations = 
      let
        system = "x86_64-linux";
        overlayModule = {
          nixpkgs.overlays = [
            (nur.overlay)
            #(import ./overlays)
          ];
        };
        commonConfigs = [
          overlayModule                 # global overlay module
          ./system/release-configs.nix  # allow non-free, pin stateVersion
          #./system/linux/zen.nix        # use linux-zen
          ./system/linux/latest.nix     # use linux-latest
          ./system/users/${userName}.nix # my account config, don't forget to set passwd
          ./system/desktop/gnome.nix    # gnome4 looks cool
          ./system/locale.nix           # IM, etc.
          ./system/fonts.nix            # fonts
          ./system/network.nix          # network manager and default configs
          ./system/services             # power, bluetooth, audio, printing
          ./system/softwares            # include nix configs
        ];
        homeConfigs = [
          # home-manager integration
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit system inputs; };
            home-manager.users.${userName} = {
              imports = [ ./home/${userName} ];
              home.stateVersion = "22.11";
            };
          }
        ];
        composeLinuxSystem = extraModules: nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit system inputs;
            inherit nixos-hardware;  # for hardware configuration or will encounter infinite recursion
          };
          modules = commonConfigs ++ homeConfigs ++ extraModules;
        };
      in
        {
          # config tp480
          tp480 = composeLinuxSystem [
            ./hosts/tp480                 # customized platform config for hardware
            ./system/power/upower-critical-hybrid-suspend.nix
          ];
        };
  };
}
