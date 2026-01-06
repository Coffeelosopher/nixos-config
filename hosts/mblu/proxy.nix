{ config, pkgs, ... }: 

{
  networking.firewall = {
    allowedTCPPorts = [
      80
      443
      2022  # Gitea / ForgeJO SSH
      25565 # Minecraft
      25575 # Minecraft RCON
    ];
     
    allowedUDPPorts = [
      24454 # Minecraft Voicechat mod
      #3478 # Headscale Stun
    ];
  };

  security.acme = {
    acceptTerms = true;
    defaults = {
      email = "nico.nicklis@icloud.com";
      dnsProvider = "1.1.1.1";
      dnsResolver = "8.8.8.8";
    };
  };

  services.nginx = {
    enable = true;
    recommendedProxySettings = true;
    recommendedGzipSettings = true;
    recommendedOptimisation = true;
    recommendedTlsSettings = true;

    streamConfig = ''
      # (BetterMC) Minecraft Stream
  	  # Conan
        server {
          listen 25565;
          proxy_timeout 20s;
          proxy_pass 100.85.197.111:25565;
        }

        server {
          listen 24454 udp;
          proxy_pass 100.85.197.111:24454;
        }

        server {
        	listen 25575;
        	proxy_pass 100.85.197.111:25575;
        }

	     # Michael' NUC
       # server {
       #   listen 25565;
       #   proxy_timeout 20s;
       #   proxy_pass 100.95.117.61:25565;
       # }
       # server {
       #   listen 25575;
       #   proxy_timeout 20s;
       #   proxy_pass 100.95.117.61:25575;
       # }
    '';

    virtualHosts."db.nicklis.org" = {
      enableACME = true;
      forceSSL = true;
      locations."/" = {
        proxyPass = "http://localhost:5984";
        proxyWebsockets = true; # needed if you need to use WebSocket
        extraConfig =
          # required when the target is also TLS server with multiple hosts
          "proxy_ssl_server_name on;" +
          # required when the server wants to use HTTP Authentication
          "proxy_pass_header Authorization;";
      };
    };

    virtualHosts."vault.nicklis.org" = {
      enableACME = true;
      forceSSL = true;
      locations."/" = {
        proxyPass = "http://localhost:888";
        proxyWebsockets = true; # needed if you need to use WebSocket
        extraConfig =
          # required when the target is also TLS server with multiple hosts
          "proxy_ssl_server_name on;" +
          # required when the server wants to use HTTP Authentication
          "proxy_pass_header Authorization;";
      };
    };

    virtualHosts."vw.nicklis.org" = {
      enableACME = true;
      forceSSL = true;
      locations."/" = {
        proxyPass = "http://localhost:888";
        proxyWebsockets = true; # needed if you need to use WebSocket
        extraConfig =
          # required when the target is also TLS server with multiple hosts
          "proxy_ssl_server_name on;" +
          # required when the server wants to use HTTP Authentication
          "proxy_pass_header Authorization;";
      };
    };
  };
}
