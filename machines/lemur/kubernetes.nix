{ config, pkgs, ...}:
{
  services.kubernetes.roles = [ "master" "node" ];
  services.kubernetes.package = sheenobupkgs.kubernetes;

  networking.firewall.enable = true;
  networking.firewall.allowTCPPorts = [ 8080 ];
}
