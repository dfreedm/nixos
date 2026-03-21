{ pkgs, ... }:
{
  # Desktop packages
  users.users.dan.packages = with pkgs; [
    calibre
    dropbox
    ghostty
    gnome-disk-utility
    haruna
    keepassxc
    libreoffice
    strawberry
    vscodium
    wl-clipboard
  ];

  programs.firefox.enable = true;
}
