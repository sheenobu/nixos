{ config, pkgs, lib, ... }:
{
    nixpkgs.config.allowUnfree = true;

    time.timeZone = "America/New_York";

    i18n = {
        consoleKeyMap = "us";
        defaultLocale = "en_US.UTF-8";
    };

    hardware.opengl.driSupport32Bit = true;
    hardware.pulseaudio = {
        enable = true;
        support32Bit = true;
        package = pkgs.pulseaudioFull;
    };

    virtualisation.docker.enable = true;

    programs.tmux = {
      enable = true;
      extraTmuxConf = builtins.readFile ./tmux/config;
    };

}
