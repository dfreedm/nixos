{
  description = "NixOS Flake Configuration";

  inputs = {
    # NixOS official package source, using the nixos-25.05 branch here
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    # NixOS Hardware configuration source
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
  };

  outputs =
    {
      self,
      nixpkgs,
      nixos-hardware,
      ...
    }@inputs:
    {
      # Please replace my-nixos with your hostname
      nixosConfigurations.chromedome = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          # Import the NixOS Hardware config first, following modules can override
          nixos-hardware.nixosModules.framework-13-7040-amd
          ./hosts/chromedome
        ];
      };
    };
}
