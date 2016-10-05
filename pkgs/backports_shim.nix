{ pkgs ? (import <nixpkgs> {}), lib }:

let

  # our custom packages
  backports = rec {

    # backport to 16.03
    fluxui = (pkgs.callPackage ./xfluxgui/gui.nix {
      pexpect = pkgs.pythonPackages.pexpect;
      pyGtkGlade = pkgs.pythonPackages.pyGtkGlade;
      pygobject = pkgs.pythonPackages.pygobject;
      pyxdg = pkgs.pythonPackages.pyxdg;
      gnome_python = pkgs.gnome.gnome_python;
    });

    mednaffe = pkgs.mednaffe;
    vscode = pkgs.vscode;
    gosu = pkgs.gosu;
    keybase_go = pkgs.keybase;
    kbfs = pkgs.kbfs;
    kubernetes = pkgs.kubernetes;
    i3-gaps = (pkgs.callPackage ./i3/gaps.nix) {};

  };
in pkgs // {
  inherit backports;
}
