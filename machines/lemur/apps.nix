{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [

    # programming utilities
    sheenobupkgs.riot
    gcc
    sheenobupkgs.docker-compose
    go
    kube-aws
    #python35Packages.awscli # takes a long time to install

    # utilities
    baobab      # for filesystem visualization
    pavucontrol # sound control
    arandr      # resolution
    spice_gtk   # spicy remote desktop
    gimp        # image editing

    # emulation
    qemu
    mednaffe
    dosbox

    # sec
    keepassx
    keybase
    kbfs

    # social
    slack
    hexchat

  ];
}
