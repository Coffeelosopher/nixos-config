{
  networking.firewall.allowedUDPPorts = [ 51820 ];

  networking.wireguard.interfaces = {
    wg0 = {
      ips = [ "10.20.20.1/24" ];
      listenPort = 51820;
      privateKeyFile = "/root/wireguard/privatekey";

      peers = [
        {
          publicKey = "l09xCGUpebQKsecyzFeMnms3MwhpIIUwHiG1y8bxrHM=";
          allowedIPs = [ "10.20.20.2/32" ];
          # Endpoint NOT needed because Alpine is behind NAT
          # No keepalive needed here
        }
      ];
    };
  };
}

