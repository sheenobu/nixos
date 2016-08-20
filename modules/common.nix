{ config, pkgs, lib, ... }:

{
	require = [
		./users.nix
	];

	# extend nixpkgs with our own package
	nixpkgs.config.packageOverrides = pkgs: {
		inherit (import ./../pkgs { inherit pkgs; inherit lib; }) sheenobupkgs;
	};

	# let's make sure only NixOS can handle users
	users.mutableUsers = false;

	# see https://github.com/NixOS/nixpkgs/commit/ee8e15fe76a235ae3583d4e8cb4bb370f28c5eae
	programs.bash.enableCompletion = true;

	# Common Packages
	environment.systemPackages = with pkgs; [
		# core
		wget tmux curl wget w3m nixops nox file autojump unrar
		socat binutils
		neovim

		# programming
		ack
		git

		# manpages
		manpages
		posix_man_pages
	];

	environment.variables.EDITOR = "nvim";

	environment.shellInit = ''
		alias vim=nvim
	'';

	# every machine should be running antivirus
	services = {
		clamav = {
			updater.enable = true;
		};
	};

	nix = rec {
		# allow users to use nix-env
		nixPath = [ "nixpkgs=http://nixos.org/channels/nixos-16.03/nixexprs.tar.xz" ];

		# use nix sandboxing for greater determinism
		useChroot = true;
	};
}
