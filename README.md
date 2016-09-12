# sheenobu/nixos

My nixos setup.

## lib

The lib folder is currently empty. No useful functions there

## Config

Generic system configuration definitions.

### XDG

The XDG configuration supports mime-type configurations:

```
environment.xdg.mimeTypes."text/nix" = {
  comment = {
    "" = "Nix Language File";
  };
  sub-class-of = "text/plain";
  globs = [ "*.nix" ];
};
```

## Packages

The packages are split into two separate parts:

 * `pkgs.sheenobupkgs` defined in [pkgs/custom.nix](pkgs/custom.nix), for custom packages.
 * `pkgs.backports` defined in [pkgs/backports.nix](pkgs/backports.nix), for backports from the next release to the current.

## Modules

Contains various modules which define things or provide configurations:

 * Asterisk 13.10.0 setup [modules/asterisk.nix](modules/asterisk.nix)
 * An elk configuration stack - [NixOS Recipes - ELK Stack](https://sheenobu.net/nixos-recipes/elk.html).
 * An XDG import and example usage [modules/xdg.nix](modules/xdg.nix)
 * Imports of the package groups into the `pkgs` namespace.
 * Backport of the tmux module from 16.09

## Testing

Testing of any machine can be done via the test folder. Run a machine
via `make THOST=name`.

If you don't have /home/$USER/nixpkgs, then it will
use the current one in your system.
