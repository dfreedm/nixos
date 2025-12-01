{ pkgs, ... }:
{
  # Desktop packages
  users.users.dan.packages = with pkgs; [
    calibre
    dropbox
    ghostty
    gnome-disk-utility
    keepassxc
    libreoffice
    strawberry
    vscodium
    wl-clipboard
  ];

  programs.firefox.enable = true;
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  };
}
