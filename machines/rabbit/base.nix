{ config, pkgs, lib, ... }:
{
    nixpkgs.config.allowUnfree = true;

    programs.tmux = {
      enable = true;
      extraTmuxConf = builtins.readFile ./tmux/config;
    };

    nixpkgs.config.packageOverrides = pkgs: {
        bluez = pkgs.bluez5;
    };

    time.timeZone = "America/New_York";

    i18n = {
        consoleKeyMap = "us";
        defaultLocale = "en_US.UTF-8";
    };

    hardware.pulseaudio = {
        enable = true;
        support32Bit = true;
        package = pkgs.pulseaudioFull;
    };
    nixpkgs.config.pulseaudio = true;

    virtualisation.docker.enable = true;

    networking = {
        networkmanager.enable = true;
    };
}
