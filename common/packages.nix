{ pkgs, ... }:

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
    vim-full
    wget
  ];

  # Common user packages
  users.users.dan.packages = with pkgs; [
    ack
    btop
    fastfetch
    ffmpeg
    jq
    nixfmt-rfc-style
    nvd
    p7zip
    python3
    rar
    tig
    unzip
    yt-dlp
    zip
  ];

  # Editor session variables
  environment.sessionVariables.EDITOR = "vim";
  environment.sessionVariables.VISUAL = "gvim -f";

}
