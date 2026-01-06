{ config, pkgs, ... }:

{
  services.transmission = {
    enable = true;
    settings = {
      watch-dir-enabled = true;
      rpc-bind-address = "0.0.0.0";
      rpc-port = 9091;
      watch-dir = "${config.services.transmission.home}/watch-dir";
      rpc-whitelist = "127.0.0.1,100.64.0.1";
    };
  };
}

