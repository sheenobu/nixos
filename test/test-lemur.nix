{ config, pkgs, lib, ... }:
{
  imports = [
    ../modules
    ../modules/backports.nix # 16.03

    ../machines/lemur/base.nix
    ../machines/lemur/desktop.nix
    ../machines/lemur/apps.nix
  ];

  environment.etc."resolution.sh".source = ./resolution.sh;

  services.xserver.windowManager.default = "i3-gaps"; # must specify default if auto.enable is on
  services.xserver.displayManager.auto.enable = true;
  services.xserver.displayManager.auto.user = "sheenobu";
  services.xserver.resolutions = { x = 1680; y = 1050; };
  services.xserver.virtualScreen = { x = 1680; y = 1050; };

  virtualisation.memorySize = 1024;
  virtualisation.qemu.options = [ "-sdl" ];

  # disable clamav so we don't try to update the virus DB every time we boot a new system
  services.clamav.updater.enable = lib.mkForce false;

  users.users.root.password = "test";
  users.users.sheenobu.password = "test";

  networking.hostName = "lemur-test";

  system.stateVersion = "16.03";
}
