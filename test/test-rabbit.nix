{ config, pkgs, lib, ... }:
{
  imports = [
    ../modules/common.nix
    ../machines/rabbit/base.nix
    ../machines/rabbit/desktop.nix
    ../machines/rabbit/apps.nix
  ];

  users.users.root.password = "test";
  users.users.sheenobu.password = "test";

  networking.hostName = "rabbit-test";

  system.stateVersion = "16.03";
}
