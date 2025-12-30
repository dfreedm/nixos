{
  # Enable bootloader
  # NOTE: If I add an ARM system, this would likely need to become conditional
  # See: https://wiki.nixos.org/wiki/Bootloader#Bootloaders_for_ARM_platforms
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
}
