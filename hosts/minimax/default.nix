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
    heroic
    nvtopPackages.amd
  ];

  # PPD for AMD CPUs
  services.power-profiles-daemon.enable = true;

  system.stateVersion = "25.11";
}
