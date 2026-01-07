{ config, pkgs, ... }:
{
  imports = [
    (import ../../server)
    (import ./graphics.nix)
    (import ./home-assistant.nix)
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

  # Disable sleep entirely
  systemd.sleep.extraConfig = ''
    AllowSuspend=no
    AllowHibernation=no
    AllowHybridSleep=no
    AllowSuspendThenHibernate=no
  '';

  system.stateVersion = "25.11";
}
