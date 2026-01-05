{ config, pkgs, ... }:
{
  imports = [
    (import ../../server)
    (import ./graphics.nix)
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  networking.hostName = "sixer";
  networking.networkmanager.enable = true;

  # Enable System76 kernel modules, power daemon, and firmware daemon
  hardware.system76.enableAll = true;

  # Enable intel microcode updates
  hardware.cpu.intel.updateMicrocode = true;

  # Enable trim
  services.fstrim.enable = true;

  # Enable tailscale exit node
  services.tailscale.useRoutingFeatures = "both";

  system.stateVersion = "25.11";
}
