{ config, pkgs, ... }: 

{
  virtualisation.docker = {
    enable = true;
    liveRestore = true;
  };

  networking.firewall.trustedInterfaces = [ "docker0" ];
  virtualisation.oci-containers.backend = "docker";
}
