{ pkgs ? (import <nixpkgs> {}), lib }:

let

  # let's define our own callPackage to avoid typing all dependencies
  callPackage = pkgs.lib.callPackageWith (pkgs // backports);

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

    # backport to 16.03
    mednaffe = (pkgs.callPackage ./mednaffe) {};

    # backport to 16.03
    gosu = (pkgs.callPackage ./gosu) {};

    # backport to 16.03
    keybase_go = (pkgs.callPackage ./keybase {
      buildGoPackage = pkgs.go16Packages.buildGoPackage;
    }).bin // { outputs = [ "bin" ]; };

    # backport to 16.03
    kbfs = (pkgs.callPackage ./keybase/kbfs.nix {
      buildGoPackage = pkgs.go16Packages.buildGoPackage;
    });

    # backport to 16.03
    kubernetes = (pkgs.callPackage ./kubernetes {
      go = pkgs.go_1_6;
    });

    # backport to 16.03
    i3-gaps = (pkgs.callPackage ./i3/gaps.nix) {};

  };
in pkgs // {
  inherit backports;
}
