{ pkgs, ... }:
{
  imports = [
    (import ../common)
  ]
  ++ [ (import ./podman.nix) ]
  ++ [ (import ./ssh.nix) ];

  environment.systemPackages = with pkgs; [
    # Install the terminfo for ghostty
    ghostty.terminfo
  ];
}
