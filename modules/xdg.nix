{ config, pkgs, lib, ... }:
{

  imports = [
    ../config/xdg.nix
  ];

  environment.xdg.mimeTypes."text/nix" = {
    comment = {
      "" = "Nix Language File";
    };
    sub-class-of = "text/plain";
    globs = [ "*.nix" ];
  };

}
