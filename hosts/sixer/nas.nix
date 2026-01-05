{
  services.samba = {
    enable = true;
    securityType = "user";
    openFirewall = true;
    settings = {
      global = {
        "workgroup" = "WORKGROUP";
        "server string" = "smbnix";
        "netbios name" = "smbnix";
        "security" = "user";
        #"use sendfile" = "yes";
        #"max protocol" = "smb2";
        # note: localhost is the ipv6 localhost ::1
        # "hosts allow" = "192.168.0. 127.0.0.1 localhost";
        # "hosts deny" = "0.0.0.0/0";
        "guest account" = "nobody";
        "map to guest" = "bad user";
      };
      "public" = {
        "path" = "/mnt/nas/samba";
        "browseable" = "yes";
        "read only" = "no";
        "guest ok" = "yes";
        "create mask" = "0700";
        "directory mask" = "0700";
        # "force user" = "username";
        # "force group" = "groupname";
      };
    };
  };

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

  # networking.firewall.enable = true;
  # networking.firewall.allowPing = true;
}
