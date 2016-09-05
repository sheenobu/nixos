# Desktop config that isn't hardware specific
{ config, pkgs, ... }:
{

  environment.systemPackages = with pkgs; [
    rofi         # for app launcher
    feh          # for background image
    scrot        # for screenshot
    libnotify    # for notifications
    tint2        # for taskbar, applet bar
    conky        # for system status
    xscreensaver # for desktop locking
    compton      # for compositor
    xsel         # for cli copy/paste
    lxappearance # for theming changes
    i3status

    xorg.xbacklight
    xorg.xwininfo
    backports.fluxui

    # theming
    gtk
    arc-gtk-theme
    gtk-engine-murrine
 ];

  environment.variables.BROWSER = "chromium";
  environment.etc."sheenobu/Xdefaults".source = ./Xdefaults;

  # audio support
  nixpkgs.config.pulseaudio = true;

  # flash support and encryption support
  nixpkgs.config.chromium.enableWideVine = true;
  nixpkgs.config.chromium.enablePepperFlash = true;

  services.xserver = {
    enable = true;
    layout = "us";

    windowManager.i3.enable = true;
    windowManager.i3.configFile = ./i3/config;

    displayManager.lightdm.enable = true;
  };

  fonts = {
    fontconfig = {
      enable = true;
    };

    enableCoreFonts = true;
    enableFontDir = true;
    enableGhostscriptFonts = true;

    fonts = with pkgs; [
      corefonts  # Micrsoft free fonts
      inconsolata  # monospaced
      ubuntu_font_family  # Ubuntu fonts
      unifont # some international languages
    ];
  };


}

