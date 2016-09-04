{ config, pkgs, lib, ... }:
{
    time.timeZone = "America/New_York";

    i18n = {
        consoleKeyMap = "us";
        defaultLocale = "en_US.UTF-8";
    };
}
