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
      #  server {
      #    listen 25565;
      #    proxy_timeout 20s;
      #    proxy_pass 100.85.197.111:25565;
      #  }

      #  server {
      #    listen 24454 udp;
      #    proxy_pass 100.85.197.111:24454;
      #  }

      #  server {
      #  	listen 25575;
      #  	proxy_pass 100.85.197.111:25575;
      #  }

        #  NUC
        ## Homestead
        server {
          listen 25565;                   
          #proxy_pass 100.95.117.61:25565; 
          #proxy_pass 100.94.150.119:25565;

          # Xavers server
          proxy_pass 100.84.20.5:25565;
          proxy_timeout 10s;
          proxy_connect_timeout 5s;
          proxy_responses 1;
        }

        ### RCON
        server {
          listen 25575; 
          #proxy_pass 100.95.117.61:25575; 
          #proxy_pass 100.94.150.119:25575;
          # xaver server
          proxy_pass 100.84.20.5:25575;
          proxy_timeout 10s;
          proxy_connect_timeout 5s;
          proxy_responses 1;
        }

        ## voicechat
        server {
          listen 24454 udp;
          #proxy_pass 100.95.117.61:24454; 
          #proxy_pass 100.94.150.119:24454;
          proxy_pass 100.84.20.5:24454;
        }

    '';

##################### Obsidian Couch DB######################

    virtualHosts."db.nicklis.org" = {
     enableACME = true;
     forceSSL = true;

     extraConfig = ''
       client_max_body_size 200M;
     '';

     locations."/" = {
       proxyPass = "http://localhost:5984";
       proxyWebsockets = true; # needed if you need to use WebSocket


       extraConfig =
         # required when the target is also TLS server with multiple hosts
         "proxy_ssl_server_name on;" +
         # required when the server wants to use HTTP Authentication
         "proxy_pass_header Authorization;"+

         "proxy_redirect off;" +
         "proxy_buffering off;"+
         "proxy_set_header Host db.nicklis.org;";
         #"proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;";
     };
    };

##################### Vaultwarden ######################

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

##################### IMMICH ######################

    virtualHosts."immich.nicklis.org" = {
      enableACME = true;
      forceSSL = true;
      extraConfig = ''
        client_max_body_size 50000M;
        # Set headers
        proxy_set_header Host              $host;
        proxy_set_header X-Real-IP         $remote_addr;
        proxy_set_header X-Forwarded-For   $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;

        # enable websockets: http://nginx.org/en/docs/http/websocket.html
        proxy_http_version 1.1;
        proxy_set_header   Upgrade    $http_upgrade;
        proxy_set_header   Connection "upgrade";
        proxy_redirect     off;

        # set timeout
        proxy_read_timeout 600s;
        proxy_send_timeout 600s;
        send_timeout       600s;
      '';
      locations."/" = {
        proxyPass = "http://100.95.117.61:2283";
        proxyWebsockets = true; # needed if you need to use WebSocket
        extraConfig =
          # required when the target is also TLS server with multiple hosts
          "proxy_ssl_server_name on;" +
          # required when the server wants to use HTTP Authentication
          "proxy_pass_header Authorization;";
      };
    };

    virtualHosts."photos.nicklis.org" = {
      enableACME = true;
      forceSSL = true;
      extraConfig = ''
        client_max_body_size 50000M;
        # Set headers
        proxy_set_header Host              $host;
        proxy_set_header X-Real-IP         $remote_addr;
        proxy_set_header X-Forwarded-For   $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;

        # enable websockets: http://nginx.org/en/docs/http/websocket.html
        proxy_http_version 1.1;
        proxy_set_header   Upgrade    $http_upgrade;
        proxy_set_header   Connection "upgrade";
        proxy_redirect     off;

        # set timeout
        proxy_read_timeout 600s;
        proxy_send_timeout 600s;
        send_timeout       600s;
      '';
      locations."/" = {
        proxyPass = "http://100.95.117.61:2283";
        proxyWebsockets = true; # needed if you need to use WebSocket
        extraConfig =
          # required when the target is also TLS server with multiple hosts
          "proxy_ssl_server_name on;" +
          # required when the server wants to use HTTP Authentication
          "proxy_pass_header Authorization;";
      };
    };

    virtualHosts."bilder.nicklis.org" = {
      enableACME = true;
      forceSSL = true;
      extraConfig = ''
        client_max_body_size 50000M;
        # Set headers
        proxy_set_header Host              $host;
        proxy_set_header X-Real-IP         $remote_addr;
        proxy_set_header X-Forwarded-For   $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;

        # enable websockets: http://nginx.org/en/docs/http/websocket.html
        proxy_http_version 1.1;
        proxy_set_header   Upgrade    $http_upgrade;
        proxy_set_header   Connection "upgrade";
        proxy_redirect     off;

        # set timeout
        proxy_read_timeout 600s;
        proxy_send_timeout 600s;
        send_timeout       600s;
      '';
      locations."/" = {
        proxyPass = "http://100.95.117.61:2283";
        proxyWebsockets = true; # needed if you need to use WebSocket
        extraConfig =
          # required when the target is also TLS server with multiple hosts
          "proxy_ssl_server_name on;" +
          # required when the server wants to use HTTP Authentication
          "proxy_pass_header Authorization;";
      };
    };

##################### Obsidian Couch DB######################

    virtualHosts."draw.nicklis.org" = {
      enableACME = true;
      forceSSL = true;
      locations."/" = {
        proxyPass = "http://localhost:5000";
        proxyWebsockets = true; # needed if you need to use WebSocket
        extraConfig =
          # required when the target is also TLS server with multiple hosts
          "proxy_ssl_server_name on;" +
          # required when the server wants to use HTTP Authentication
          "proxy_pass_header Authorization;";
      };
    };

    virtualHosts."excalidraw.nicklis.org" = {
      enableACME = true;
      forceSSL = true;
      locations."/" = {
        proxyPass = "http://localhost:5000";
        proxyWebsockets = true; # needed if you need to use WebSocket
        extraConfig =
          # required when the target is also TLS server with multiple hosts
          "proxy_ssl_server_name on;" +
          # required when the server wants to use HTTP Authentication
          "proxy_pass_header Authorization;";
      };
    };

##################### END ######################
  };
}
