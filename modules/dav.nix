{ config, pkgs, lib, ... }:
{

  users.groups.davfs2.name = "davfs2";

  # may not need a davfs2 user?
  users.extraUsers.davfs2 = {
    isNormalUser = false;
    uid = 1003;
  };

  environment.systemPackages = with pkgs; [
	davfs2
  ];
}

