{ stdenv, nodePackages }:
let
  np = nodePackages.override { generated = ./package.nix; self = np; };
in
np."riot-cli"
