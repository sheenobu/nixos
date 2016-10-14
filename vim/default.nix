{ pkgs ? (import <nixpkgs> {}), lib }:

let

  vimThemes = rec {
    tomorrowNight = (pkgs.callPackage ./themes/tomorrow-night) {};
  };

  vimPackages = rec {
    vimGo = (pkgs.callPackage ./pkgs/vim-go) {};
    vimNix = (pkgs.callPackage ./pkgs/vim-nix) {};
    vimElm = (pkgs.callPackage ./pkgs/vim-elm) {};
    vimVala = (pkgs.callPackage ./pkgs/vim-vala) {};
  };

in pkgs // {
  inherit vimPackages;
  inherit vimThemes;
}
