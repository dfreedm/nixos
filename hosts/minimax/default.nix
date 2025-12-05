{ config, pkgs, ... }:
{
  imports = [
    (import ../../desktop)
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  boot.kernelPackages = pkgs.linuxPackages_latest;
  networking.hostName = "minimax";

  # Specific packages for this machine
  users.users.dan.packages = with pkgs; [
    discord
    nvtopPackages.amd
  ];

  # Enable firmware updates
  services.fwupd.enable = true;

  system.stateVersion = "25.11";
}
