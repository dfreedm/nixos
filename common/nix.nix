{ ... }:
{
  # Nix settings
  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 2w";
    };
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
}
