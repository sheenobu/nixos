{ config, pkgs, lib, ... }:
{

  services.xserver.enable = true;
  services.xserver.windowManager.i3.enable = true;
  services.xserver.windowManager.default = "i3"; # must specify default if auto.enable is on
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.displayManager.lightdm.autoLogin.enable = true;
  services.xserver.displayManager.lightdm.autoLogin.user = "root";
  services.xserver.resolutions = { x = 1680; y = 1050; };
  services.xserver.virtualScreen = { x = 1680; y = 1050; };

  virtualisation.memorySize = 1024;
  virtualisation.qemu.options = [ "" ];

  users.users.root.password = "test";
  networking.hostName = "basic-test";

  system.stateVersion = "16.03";
}
