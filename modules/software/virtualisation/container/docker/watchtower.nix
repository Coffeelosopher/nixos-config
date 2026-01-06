{ config, pkgs, ... }: 

{
  imports = [ ./default.nix ];

  virtualisation.oci-containers.containers."watchtower" = {
    autoStart = true;
    image = "containrrr/watchtower";
    volumes = [
      "/var/run/docker.sock:/var/run/docker.sock"
      "/etc/localtime:/etc/localtime:ro"
    ];
    cmd = [ "-i" "3600" "--include-restarting" "--rolling-restart" ];
  };
}
