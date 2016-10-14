{ pkgs, system, stdenv, makeWrapper, nodejs }:

with stdenv.lib;

let
  nodePackages = import ./nodepkgs.nix {
    inherit pkgs system nodejs;
  };
in
nodePackages.riot-cli
