{
  services.tailscale.enable = true;
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };
  # Trim SSDs
  services.fstrim.enable = true;
  # Enable firmware updates
  services.fwupd.enable = true;
  # Use compressed ram for swap space
  zramSwap.enable = true;
  # Powertop runs once to lower overall energy use
  powerManagement.powertop.enable = true;
}
