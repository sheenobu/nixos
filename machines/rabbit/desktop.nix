# Desktop config that isn't hardware specific
{ config, pkgs, ... }:
{

  services.xserver = {
    enable = true;
    layout = "us";

    windowManager.i3-gaps.enable = true;
    displayManager.lightdm.enable = true;
  };

  hardware = {
    opengl.driSupport32Bit = true;
	pulseaudio.enable = true;
  };

  fonts = {
    fontconfig = {
      enable = true;
      dpi = 120;
    };

    enableCoreFonts = true;
    enableFontDir = true;
    enableGhostscriptFonts = true;

    fonts = with pkgs; [
      terminus_font
      corefonts  # Micrsoft free fonts
      inconsolata  # monospaced
      ubuntu_font_family  # Ubuntu fonts
      unifont # some international languages
      hack-font
      font-awesome-ttf
    ];
  };


}

