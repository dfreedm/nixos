{ ... }:
{
  services.tailscale.enable = true;
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };
  services.fstrim.enable = true;
  zramSwap.enable = true;
}
