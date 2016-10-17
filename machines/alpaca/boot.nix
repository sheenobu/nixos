{ config, pkgs, lib, ... }:
{
  boot = {
    kernelPackages = pkgs.linuxPackages;
    kernelParams = [ "ipv6.disable=1" ]; # "pcie_aspm=off" ];
    loader.systemd-boot.enable = true;
  };
}
