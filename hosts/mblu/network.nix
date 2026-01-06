{ config, lib, pkgs, ... }: 

{
	networking = {
    domain = "";
	  interfaces = {
	    ens3.ipv4.addresses = [{
	      address = "195.90.211.242";
	      prefixLength = 22;
	    }];
	  };

	  defaultGateway = {
	    address = "195.90.208.1";
	    interface = "ens3";
	  };

	  nameservers = [ 
      "1.1.1.1" 
      "8.8.8.8" 
    ];
	};


  ####### MISC #######

  # Move to Systemd Networkd ?
  # systemd.network = {
  #   enable = true;
  #   wait-online = {
  #     ignoredInterfaces = [ "eno1" "thunderbolt0" ];
  #     timeout = 10;
  #   };
  #   netdevs.br0.netdevConfig = {
  #     Name = "br0";
  #     Kind = "bridge";
  #     #MTUBytes = "9000";
  #   };
  #   networks = {
  #     br0 = {
  #       dns = [ "94.140.14.14" "94.140.15.15" ];
  #       matchConfig = { Name = "br0"; };
  #       networkConfig = { DHCP = "ipv6"; };
  #       address = [ "192.168.2.123/24" ];
  #       routes = [{ routeConfig.Gateway = "192.168.2.1"; }];
  #     };
  #     eno1 = {
  #       matchConfig = { Name = "eno1"; };
  #       networkConfig = { Bridge = "br0"; };
  #     };
  #     thunderbolt0 = {
  #       matchConfig = { Name = "thunderbolt0"; };
  #       networkConfig = { Bridge = "br0"; };
  #     };
  #   };
  # };
}
