{ config, pkgs, lib, ... }:
{
	nixpkgs.config.packageOverrides = pkgs: {
		inherit (import ./../pkgs/backports.nix { inherit pkgs; inherit lib; }) backports;
	};
}
