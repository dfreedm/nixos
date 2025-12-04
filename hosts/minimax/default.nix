{ config, pkgs }:
{
  imports = [
    (import ../../desktop)
    # Include the results of the hardware scan.
    # ./hardware-configuration.nix
  ];

  networking.hostname = "minimax";

  # Specific packages for this machine
  users.users.dan.packages = with pkgs; [
    nvtopPackages.amd
  ];

  # Enable firmware updates
  services.fwupd.enable = true;
}
