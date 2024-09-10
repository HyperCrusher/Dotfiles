{
  description = "Hyper's Nix configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";

    zen-browser.url = "github:heywoodlh/flakes/main?dir=zen-browser";
  };

  outputs =
    { self, nixpkgs, ... }@inputs:
    {
      nixosConfigurations.home-desktop = nixpkgs.lib.nixosSystem rec {
        system = "x86_64-linux";
        specialArgs = {
          inherit inputs system;
          user = import ./lib/user.nix;
          machine = "home-desktop";
        };
        modules = [
          ./system/configuration.nix
        ];
      };
    };
}