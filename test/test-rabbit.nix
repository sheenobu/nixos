{ config, pkgs, lib, ... }:
{
  imports = [
    ../modules
    ../modules/backports.nix # 16.03

    ../machines/rabbit/base.nix
    ../machines/rabbit/desktop.nix
    ../machines/rabbit/apps.nix
  ];

  virtualisation.memorySize = 1024;
  virtualisation.qemu.options = [ "-full-screen -sdl" ];

  # disable clamav so we don't try to update the virus DB every time we boot a new system
  services.clamav.updater.enable = lib.mkForce false;

  users.users.root.password = "test";
  users.users.sheenobu.password = "test";

  networking.hostName = "rabbit-test";

  system.stateVersion = "16.03";
}
