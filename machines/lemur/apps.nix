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
    arandr # resolution
    nitrogen # wallpaper setting
    spice_gtk # spicy remote desktop
    xfce.thunar # filesystem
    gimp # image editing

    # emulation
    qemu
    backports.mednaffe

    # terminal
    rxvt_unicode

    # sec
    keepassx
    backports.keybase_go

    # social
    slack
    hexchat

    # music
    spotify
  ];
}


