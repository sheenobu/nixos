{ config, pkgs, lib, ... }:
{
  imports = [
    ../../modules
    ./base.nix
    ./boot.nix
    ./desktop.nix
    ./hardware.nix
  ];
}
