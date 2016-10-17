{ config, pkgs, ... }:
{
    environment.systemPackages = with pkgs; [
        # programming utilities
        gcc
        #python35Packages.awscli

        sheenobupkgs.riot

        sheenobupkgs.docker-compose

        # browsers
        chromium
        firefox

        baobab # for filesystem visualization

        # emulation
        qemu

        # terminal
        rxvt_unicode

        # social
        slack

        # sec
        keepassx
        keybase
        kbfs
        kube-aws
    ];

    programs.tmux = {
      enable = true;
      extraTmuxConf = builtins.readFile ./tmux/config;
    };

}


