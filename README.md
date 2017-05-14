# sheenobu/nixos

Nixos setup.

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

The only package we currently include in core config is `nix-home`. Everything
else is handled on a per-user basis.

## Modules

Contains various modules which define things or provide configurations:

 * An XDG import and example usage [modules/xdg.nix](modules/xdg.nix)

## Testing

Testing of any machine can be done via the test folder. Run a machine
via `make THOST=name`.

If you don't have /home/$USER/nixpkgs, then it will
use the current one in your system.
