{ config, lib, pkgs, ... }: 

{
  networking = {
    interfaces = {
      enp1s0.ipv4.addresses = [{
        address = "192.168.178.20";
        prefixLength = 24;
      }];
    };
  
    defaultGateway = {
      address = "192.168.178.1";
      interface = "enp1s0";
    };
    nameservers = [ "1.1.1.1" "8.8.8.8" ];
  };
  
  
  networking.firewall = {
    allowedTCPPorts = [
      80
      443
      2022 # Gitea / ForgeJO SSH
      25565 # Minecraft
      25575 # Minecraft RCON
    ];
  
    allowedUDPPorts = [
      #3478 # Headscale Stun
      24454 # minecraft voicechat
    ];
  };
}
