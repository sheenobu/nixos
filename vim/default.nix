{ pkgs ? (import <nixpkgs> {}), lib }:

let

  vimThemes = rec {
    tomorrowNight = (pkgs.callPackage ./themes/tomorrow-night) {};
  };

  vimPackages = rec {
    vimGo = (pkgs.callPackage ./pkgs/vim-go) {};
    vimNix = (pkgs.callPackage ./pkgs/vim-nix) {};
  };

in pkgs // {
  inherit vimPackages;
  inherit vimThemes;
}
