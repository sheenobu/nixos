{ config, pkgs, ... }:
{
    environment.systemPackages = with pkgs; [
        # programming utilities
        gcc
        python35Packages.awscli

        backports.vscode
        backports.keybase_go
        backports.kubernetes

        sheenobupkgs.riot

        # media
        #spotify
        steam
        libdvdread

        # browsers
        chromium
        firefox

        baobab # for filesystem visualization

        # emulation
        backports.mednaffe # emulation
        wineUnstable
        qemu

        # terminal
        rxvt_unicode
        terminus_font

        # social
        slack
    ];

    programs.tmux = {
      enable = true;
      extraTmuxConf = builtins.readFile ./tmux/config;
    };

}


