{ config, pkgs, ... }:
{
  imports = [
    (import ../../desktop)
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  networking.hostName = "minimax";
  
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Specific packages for this machine
  users.users.dan.packages = with pkgs; [
    discord
    # Non steam games
    heroic
    nvtopPackages.amd
    # Game mod manager
    r2modman
  ];

  # PPD for AMD CPUs
  services.power-profiles-daemon.enable = true;

  system.stateVersion = "25.11";
}
