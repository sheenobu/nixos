{ config, pkgs, lib, ... }:
{
	services = {
		xserver = {
			videoDrivers = [ "nvidia" ];
			synaptics = {
				enable = true;

				# http://who-t.blogspot.fr/2010/11/how-to-ignore-configuration-errors.html
				dev = "/dev/input/event*";
				twoFingerScroll = true;
				accelFactor = "0.001";
				buttonsMap = [ 1 3 2 ];
			};
		};
	};

	hardware = {
		opengl.driSupport32Bit = true;
		bluetooth = {
			enable = true;
		};
	};
}
