{ config, lib, pkgs, ... }: 

{
	networking = {
    domain = "";
	  interfaces = {
	    ens3.ipv4.addresses = [{
	      address = "178.254.24.20";
	      prefixLength = 23;
	    }];
	  };

	  defaultGateway = {
	      address = "178.254.24.1";
	    interface = "ens3";
	  };

	  nameservers = [ 
      "1.1.1.1" 
      "8.8.8.8" 
    ];
	};
}
