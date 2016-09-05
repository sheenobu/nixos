{ pkgs ? (import <nixpkgs> {}), lib }:

let

  # let's define our own callPackage to avoid typing all dependencies
  callPackage = pkgs.lib.callPackageWith (pkgs // sheenobupkgs);

  sheenobupkgs = rec {
    r8168 = (pkgs.callPackage ./r8168/r8168.nix);
    riot = (pkgs.callPackage ./riot) {};
  };

in pkgs // {
  inherit sheenobupkgs;
}
