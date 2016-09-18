{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [

    # programming utilities
    sheenobupkgs.riot
    gcc
    #python35Packages.awscli
    sheenobupkgs.docker-compose

    # browsers
    chromium
    firefox

    # utilities
    baobab # for filesystem visualization
    pavucontrol # sound
    backports.keybase_go
    arandr # resolution

    # emulation
    qemu

    # terminal
    rxvt_unicode

    # sec
    keepassx

    # social
    slack
    hexchat

    # music
    spotify
  ];
}


