{ pkgs, ... }:
{
  services.samba = {
    enable = true;
    # Required for auto discovery
    package = pkgs.samba4Full;
    securityType = "user";
    openFirewall = true;
    shares.public = {
      path = "/mnt/nas/samba";
      writable = "true";
    };
  };

  # Turn on discovery over mDNS
  services.avahi.publish = {
    enable = true;
    userServices = true;
  };

  # Discovery for Windows
  services.samba-wsdd = {
    enable = true;
    openFirewall = true;
  };

  users.users."dan".extraGroups = [ "samba" ];
}
