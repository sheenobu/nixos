{ config, pkgs, lib, ... }:
{
    nixpkgs.config.allowUnfree = true;

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

    virtualisation.docker.enable = true;

    networking = {
        networkmanager.enable = true;
        enableIPv6 = false;
    };
}
