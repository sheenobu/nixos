# vim bundle packages

Vim bundles as nix packages.

## Usage in nix-home:

```
with import <nixpkgs> {};
with import <nixhome> { inherit stdenv; inherit pkgs; };
with import path-to-vim/default.nix { inherit lib; };
mkHome {
	user = "...";
	files = {
		".nvim/bundle/vim-go" = vimPackages.vimGo;
	};
}
```

## Usage in NixOS

TODO

## Usage in standard Nix

TODO

