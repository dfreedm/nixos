{
  imports = [
    (import ../common)
  ]
  ++ [ (import ./audio.nix) ]
  ++ [ (import ./bluetooth.nix) ]
  ++ [ (import ./printing.nix) ]
  ++ [ (import ./fonts.nix) ]
  ++ [ (import ./kde.nix) ]
  ++ [ (import ./packages.nix) ]
  ++ [ (import ./networking.nix) ];
}
