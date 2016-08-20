{ config, pkgs, ... }:

{
	users.extraUsers.sheenobu = {
		isNormalUser = true;
		uid = 1000;
		extraGroups = [
			"disk"
			"davfs2"
			"wheel"
			"video"
			"networkmanager"
			"docker"
			"audio"
			"vboxusers"
		];
	};
}

