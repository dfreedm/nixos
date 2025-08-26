{ pkgs, ... }:
{
  hardware.graphics.enable = true;
  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.desktopManager.plasma6.enable = true;

  # KDE specific packages
  users.users.dan.packages = with pkgs; [
    haruna # KDE gui for mpv
    kdePackages.kalk # Calculator
    kdePackages.kpat # Solitare
  ];

  # Wayland and/or HiDPI environment variables
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  environment.sessionVariables.QT_AUTO_SCREEN_SCALE_FACTOR = "1";
  environment.sessionVariables.QT_ENABLE_HIGHDPI_SCALING = "1";
  environment.sessionVariables.QT_QPA_PLATFORM = "wayland";
  environment.sessionVariables.MOZ_ENABLE_WAYLAND = "1";
}
