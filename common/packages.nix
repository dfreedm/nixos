{ config, pkgs, ... }:

{
  programs.zsh.enable = true;
  programs.tmux.enable = true;
  programs.git.enable = true;
  # Allow third-party binaries to work
  programs.nix-ld.enable = true;

  # System packages
  environment.systemPackages = with pkgs; [
    acpi
    curl
    lm_sensors
    nvme-cli
    smartmontools
    vim
    wget
  ];

  # Common user packages
  users.users.dan.packages = with pkgs; [
    ack
    btop
    fastfetch
    jq
    nixfmt-rfc-style
    python3
    tig
    yt-dlp
  ];

}
