{ pkgs ? (import <nixpkgs> {}), lib }:

let

  # let's define our own callPackage to avoid typing all dependencies
  callPackage = pkgs.lib.callPackageWith (pkgs // vimPackages);

  vimPackages = rec {
    vimGo = (pkgs.callPackage ./pkgs/vim-go) {};
  };

in pkgs // {
  inherit vimPackages;
}
