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

  # Enable MDADM
  boot.swraid = {
    enable = true;
    mdadmConf = ''
      ARRAY /dev/md/nas  metadata=1.2 UUID=c885239d:c517b217:6a68428c:da2acecc name=pumpkin:nas
    '';
  };

  fileSystems."/mnt/nas" = {
    device = "/dev/md127";
  };
}
