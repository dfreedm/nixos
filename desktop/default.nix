{ ... }:
{
  imports = [
    (import ./audio.nix)
  ]
  ++ [ (import ./boot.nix) ]
  ++ [ (import ./printing.nix) ]
  ++ [ (import ./fonts.nix) ]
  ++ [ (import ./kde.nix) ]
  ++ [ (import ./packages.nix) ]
  ++ [ (import ./networking.nix) ];
}
