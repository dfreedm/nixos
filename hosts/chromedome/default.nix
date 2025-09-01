{ config, pkgs, ... }:
{

  imports = [
    (import ../../desktop)
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  # Fixes for Mediatek wifi cards on F13/F16:. Without the following,
  # Mediatek cards have been limited to 802.11n networks & speeds:
  hardware.wirelessRegulatoryDatabase = true;
  boot.extraModprobeConfig = ''
    options cfg80211 ieee80211_regdom="US"
  '';
  # End Mediatek wifi fixes

  # Bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  # Enable light sensor
  hardware.sensor.iio.enable = true;

  networking.hostName = "chromedome"; # Define your hostname.

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # PPD for AMD cpus
  services.power-profiles-daemon.enable = true;

  # Powertop runs once to lower overall energy use
  powerManagement.powertop.enable = true;

  # Specific packages for this machine
  users.users.dan.packages = with pkgs; [
    nvtopPackages.amd
    signal-desktop
  ];

  # Flatpak for Zoom, because NixOS zoom bluetooth is wonky
  services.flatpak.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

  # Enable firmware updates
  services.fwupd.enable = true;
}
