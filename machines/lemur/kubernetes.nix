{ config, pkgs, ...}:
{
  services.kubernetes.roles = [ "master" "node" ];
  services.kubernetes.package = pkgs.sheenobupkgs.kubernetes;

  networking.firewall.enable = true;
  networking.firewall.allowedTCPPorts = [ 8080 ];
}
