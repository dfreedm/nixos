{ config, pkgs, ... }:
{

  imports = [
    (import ../../desktop)
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  networking.hostName = "chromedome";

  # Fixes for Mediatek wifi cards on F13/F16:. Without the following,
  # Mediatek cards have been limited to 802.11n networks & speeds:
  boot.extraModprobeConfig = ''
    options cfg80211 ieee80211_regdom="US"
  '';
  # End Mediatek wifi fixes

  # PPD for AMD cpus
  services.power-profiles-daemon.enable = true;

  # Specific packages for this machine
  users.users.dan.packages = with pkgs; [
    nvtopPackages.amd
    signal-desktop
    zoom-us
  ];

  # qFlipper app and udev rules
  hardware.flipperzero.enable = true;

  # Use latest kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?
}
