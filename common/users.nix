{ pkgs, ... }:
{
  users.users.dan = {
    isNormalUser = true;
    description = "dan";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    shell = pkgs.zsh;
  };
}
