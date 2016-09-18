{ config, pkgs, lib, ... }:
{

  # 16.03 backports

  imports = [
    ./tmux.nix
    ./i3.nix
  ];

  nixpkgs.config.packageOverrides = pkgs: {
    inherit (import ./../pkgs/backports.nix { inherit pkgs; inherit lib; }) backports;
  };
}
