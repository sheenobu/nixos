{ config, pkgs, ... }:
{
  users.extraUsers.sheenobu = {
    isNormalUser = true;
    uid = 1000;
    extraGroups = [
      "disk"
      "wheel"
      "video"
      "networkmanager"
      "docker"
      "audio"
      "vboxusers"
      "libvirtd"
    ];
  };
}

