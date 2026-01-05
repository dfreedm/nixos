{ config, pkgs, ... }:
{
  imports = [
    (import ../server)
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  networking.hostName = "sixer";

  # Enable System76 kernel modules, power daemon, and firmware daemon
  hardware.system76.enableAll = true;

  system.stateVersion = "25.11";
}
