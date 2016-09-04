{ config, pkgs, ...}:
{

  imports = [
    ../services/kubernetes.nix
  ];

  services.kubernetesX.roles = [ "master" "node" ];
  services.kubernetesX.package = pkgs.sheenobupkgs.kubernetes;

  networking.firewall.enable = true;
  networking.firewall.allowedTCPPorts = [ 8080 ];
}
