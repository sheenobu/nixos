{ config, pkgs, lib, ... }:
{
  boot = {
    blacklistedKernelModules = [ "r8169" ];
    extraModulePackages = [
     (pkgs.sheenobupkgs.r8168 { kernel = pkgs.linux; })
    ];
    kernelPackages = pkgs.linuxPackages;
    kernelParams = [ "ipv6.disable=0" ]; # "pcie_aspm=off" ];
    loader.gummiboot.enable=true;
  };
}
