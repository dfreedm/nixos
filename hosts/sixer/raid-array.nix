{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    btrfs-progs
  ];

  # Weekly scrub
  services.btrfs.autoScrub = {
    enable = true;
    interval = "weekly";
    fileSystems = [ "/mnt/data" ];
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
    options = [
      "defaults"
      # Wait 3 seconds for the disk to show up. Default is 90 seconds
      "x-systemd.device-timeout=3s"
      # Disk array has a separate power system, so don't block boot if it isn't on.
      "nofail"
    ];
  };

  fileSystems."/mnt/data" = {
    device = "UUID=52558741-b3aa-45e7-a25c-77a5dd2416a0";
    options = [
      "defaults"
      # Wait 3 seconds for the disk to show up. Default is 90 seconds
      "x-systemd.device-timeout=3s"
      # Disk array has a separate power system, so don't block boot if it isn't on.
      "nofail"
      # Enable compression
      "compress=zstd"
    ];
  };
}
