# Desktop config that isn't hardware specific
{ config, lib, pkgs, ... }:
{

  environment.variables.BROWSER = "chromium";

  services.xserver = {
    enable = true;
    layout = "us";

    windowManager.i3.enable = true;
    windowManager.i3.package = pkgs.i3-gaps;
  };

  services.gnome3.sushi.enable = true;
  services.gnome3.at-spi2-core.enable = true;

  fonts = {
    fontconfig = {
      enable = true;
    };

    enableCoreFonts = true;
    enableFontDir = true;
    enableGhostscriptFonts = true;

    fonts = with pkgs; [
      terminus_font
      corefonts           # Microsoft free fonts
      inconsolata         # monospaced
      ubuntu_font_family  # Ubuntu fonts
      unifont             # some international languages
      font-awesome-ttf
      hack-font
    ];
  };
}
