{ pkgs, ... }:
{
  # Nicer fonts
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      powerline-fonts
      google-fonts
      noto-fonts-color-emoji
      source-code-pro
    ];
    fontconfig = {
      antialias = true;
      cache32Bit = true;
      hinting.enable = true;
      hinting.autohint = true;
      useEmbeddedBitmaps = true;
      defaultFonts.emoji = [ "Noto Color Emoji" ];
    };
  };
}
