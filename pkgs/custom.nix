{ pkgs ? (import <nixpkgs> {}), lib }:

let

  # let's define our own callPackage to avoid typing all dependencies
  callPackage = pkgs.lib.callPackageWith (pkgs // sheenobupkgs);

  sheenobupkgs = rec {
    r8168 = (pkgs.callPackage ./r8168/r8168.nix);
    riot = (pkgs.callPackage ./riot) {};
    osu = (pkgs.callPackage ./osu) {};
    nix-home = (pkgs.callPackage ./nix-home) {};
    docker-compose = (pkgs.callPackage ./docker-compose) {};
    gb = (pkgs.callPackage ./gb { buildGoPackage = pkgs.go16Packages.buildGoPackage ; }).bin // { outputs = [ "bin" ]; };
  };

in pkgs // {
  inherit sheenobupkgs;
}
