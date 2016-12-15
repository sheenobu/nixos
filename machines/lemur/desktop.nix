# Desktop config that isn't hardware specific
{ config, pkgs, ... }:
{

  environment.systemPackages = with pkgs; [
    rofi         # for app launcher
    nitrogen     # for background image
    scrot        # for screenshot
    libnotify    # for notifications
    xscreensaver # for desktop locking
    compton      # for compositor
    xsel         # for cli copy/paste
    i3status     # for i3bar
    rxvt_unicode # terminal

    # x11 utilities
    xorg.xwininfo
    xorg.xkill
  ];

  environment.variables.BROWSER = "chromium";

  # Run xfce as the desktop manager but replace the window manager
  # with i3-gaps.
  services.xserver = {
    enable = true;
    layout = "us";

    desktopManager.xfce.enable = true;
    windowManager.i3-gaps.enable = true;
    displayManager.lightdm.enable = true;
  };

  # Font configuration
  fonts = {
    fontconfig = {
      enable = true;
    };

    enableCoreFonts = true;
    enableFontDir = true;
    enableGhostscriptFonts = true;

    fonts = with pkgs; [
      terminus_font
      corefonts  # Microsoft free fonts
      inconsolata  # monospaced
      ubuntu_font_family  # Ubuntu fonts
      unifont # some international languages
    ];
  };
}
