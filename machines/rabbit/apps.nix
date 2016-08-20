{ config, pkgs, ... }:
{
	environment.systemPackages = with pkgs; [
		#spotify
		chromium
		firefox
	    baobab       # for filesystem visualization
	];
}


