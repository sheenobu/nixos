{ config, pkgs, lib, ... }:
{

  environment.systemPackages = with pkgs; [ shared_mime_info xdg_utils ];
  environment.xdg.mimeTypes."text/nix" = {
    comment = {
      "" = "Nix Language File";
    };
    sub-class-of = "text/plain";
    globs = [ "*.nix" ];
  };

  virtualisation.memorySize = 512;
  virtualisation.qemu.options = [ "-sdl" ];

  boot.extraKernelParams = [ "vga16fb.modeset=0" "vga=0" "vga.modeset=0" ];
  boot.vesa = false;

  users.users.root.password = "test";
  networking.hostName = "xdg-test";

  system.stateVersion = "16.03";
}
