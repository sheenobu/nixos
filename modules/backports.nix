{ config, pkgs, lib, ... }:
{

  # 16.03 backports

  imports = [
    ./tmux.nix
  ];

  nixpkgs.config.packageOverrides = pkgs: {
    inherit (import ./../pkgs/backports.nix { inherit pkgs; inherit lib; }) backports;
  };
}
