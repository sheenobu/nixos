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
  callPackage = pkgs.lib.callPackageWith (pkgs // sheenobupkgs);

  # our custom packages
  sheenobupkgs = rec {

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

    # not included
    r8168 = (pkgs.callPackage ./r8168/r8168.nix);

    # not included
    riot = (pkgs.callPackage ./riot) {};

    # backport to 16.03
    gosu = (pkgs.callPackage ./gosu) {};

    # backport to 16.03
    keybase_go = (pkgs.callPackage ./keybase {
      buildGoPackage = pkgs.go16Packages.buildGoPackage;
    }).bin // { outputs = [ "bin" ]; };

  };
in pkgs // {
  inherit sheenobupkgs;
}
