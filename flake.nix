{
description = "Chromedome Flake";

  inputs = {
    # NixOS official package source, using the nixos-25.05 branch here
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    # Please replace my-nixos with your hostname
    nixosConfigurations.chromedome = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        # Import the previous configuration.nix we used,
        # so the old configuration file still takes effect
        nixos-hardware.nixosModules.framework-13-inch-7040-amd
        ./configuration.nix
      ];
    };
  };
}