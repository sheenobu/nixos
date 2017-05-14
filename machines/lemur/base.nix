{ config, pkgs, lib, ... }:
{
  nixpkgs.config.allowUnfree = true;

  time.timeZone = "America/New_York";

  i18n = {
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
  };

  networking.enableIPv6 = true;
  networking.nameservers = [ "192.168.1.1" ];

  # Enable 32bit opengl DRI. Useful for
  # wine and other 32-bit programs but
  # may not be required now that the nvidia
  # driver is out.
  hardware.opengl.driSupport32Bit = true;

  # Enable pulse audio, using full installation
  hardware.pulseaudio.enable = true;
  hardware.pulseaudio.package = pkgs.pulseaudioFull;
  nixpkgs.config.pulseaudio = true;

  # Enable 32bit pulseaudio support. Useful for
  # wine and other 32-bit programs.
  hardware.pulseaudio.support32Bit = true;

  virtualisation.docker.enable = true;
  virtualisation.virtualbox.host.enable = true;

  programs.tmux = {
    enable = true;
    extraTmuxConf = builtins.readFile ./tmux/config;
  };
}
