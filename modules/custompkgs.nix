{ config, pkgs, lib, ... }:
{
  # extend nixpkgs with our own package
  nixpkgs.config.packageOverrides = pkgs: {
    inherit (import ./../pkgs/custom.nix { inherit pkgs; inherit lib; }) sheenobupkgs;
  };
}
