{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    btrfs-progs
  ];

  # Weekly scrub
  services.btrfs.autoScrub = {
    enable = true;
    fileSystems = [ "/mnt/data" ];
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
