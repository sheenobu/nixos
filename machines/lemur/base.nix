{ config, pkgs, lib, ... }:
{
    nixpkgs.config.allowUnfree = true;

    time.timeZone = "America/New_York";

    i18n = {
        consoleKeyMap = "us";
        defaultLocale = "en_US.UTF-8";
    };
}
