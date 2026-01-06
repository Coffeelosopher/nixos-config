{ config, lib, pkgs, ... }: 

{
	networking = {
    useDHCP = false;
    dhcpcd.enable = false;

    domain = "";
	  interfaces = {
	    eno1.ipv4.addresses = [{
	      address = "192.168.178.197";
	      prefixLength = 24;
	    }];
	  };

	  defaultGateway = {
	      address = "192.168.178.1";
	      interface = "eno1";
	  };

	  nameservers = [ 
      "1.1.1.1" 
      "8.8.8.8" 
    ];
	};

  #systemd.network.wait-online.enable = false;
  systemd.services."NetworkManager-wait-online".enable = false;
}
