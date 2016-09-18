{ pkgs ? (import <nixpkgs> {}), lib }:

let

  # backport to 16.03, for makeSearchPathOutput
  getOutput = output: pkg:
    if pkg.outputUnspecified or false
      then pkg.${output} or pkg.out or pkg
      else pkg;

  # backport to 16.03
  makeSearchPathOutput = output: subDir: pkgs: lib.makeSearchPath subDir (map (getOutput output) pkgs);

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
    atomEnv = (pkgs.callPackage ./vscode/atom-env.nix) {
      gconf = pkgs.gnome.GConf;
      makeSearchPathOutput = makeSearchPathOutput;
    };

    # backport to 16.03
    vscode = (pkgs.callPackage ./vscode) {
      atomEnv = atomEnv;
    };

    # backport to 16.03
    gosu = (pkgs.callPackage ./gosu) {};

    # backport to 16.03
    keybase_go = (pkgs.callPackage ./keybase {
      buildGoPackage = pkgs.go16Packages.buildGoPackage;
    }).bin // { outputs = [ "bin" ]; };

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
