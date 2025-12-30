{
  imports = [
    (import ./nix.nix)
  ]
  ++ [ (import ./boot.nix) ]
  ++ [ (import ./locale.nix) ]
  ++ [ (import ./packages.nix) ]
  ++ [ (import ./services.nix) ]
  ++ [ (import ./users.nix) ];
}
