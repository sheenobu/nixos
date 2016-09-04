{ config, pkgs, ... }:
{
    environment.systemPackages = with pkgs; [
        # programming utilities
        gcc
        python35Packages.awscli
        sheenobupkgs.vscode
        sheenobupkgs.riot
        sheenobupkgs.keybase_go
        sheenobupkgs.kubernetes

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
        terminus_font

        # social
        slack
    ];

    programs.tmux = {
      enable = true;
      extraTmuxConf = builtins.readFile ./tmux/config;
    };

}


