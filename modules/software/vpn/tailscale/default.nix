{ config, pkgs, ... }: 

{
  services.tailscale = {
    enable = true;
    useRoutingFeatures = "both";
    port = 0; # Random
    interfaceName = "tailscale0";

  };

  networking.firewall = {
     allowedTCPPorts = [ 
         41641
       ];

     allowedUDPPorts = [ 
         41641
       ];

    checkReversePath = "loose";
    trustedInterfaces = [ "tailscale0" ];
  };
}
