{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [

    # programming utilities
    sheenobupkgs.riot
    gcc
    #python35Packages.awscli
    sheenobupkgs.docker-compose
    go
    sheenobupkgs.vscode

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
    xorg.xkill # killing X windows

    # emulation
    qemu
    mednaffe
    dosbox

    # terminal
    rxvt_unicode

    # sec
    keepassx
    keybase
    kbfs
    kube-aws

    # social
    slack
    hexchat

    # music
    spotify
  ];
}


