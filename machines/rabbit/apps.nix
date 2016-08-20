{ config, pkgs, ... }:
{
    environment.systemPackages = with pkgs; [

        # media
        #spotify
        steam
        libdvdread

        # browsers
        chromium
        firefox

        baobab # for filesystem visualization

        # emulation
        sheenobupkgs.mednaffe # emulation
        wineUnstable
        qemu

        # terminal
        rxvt_unicode

        # social
        slack
    ];


}


