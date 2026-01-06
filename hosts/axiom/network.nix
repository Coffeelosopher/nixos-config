{ config, lib, pkgs, ... }: 

{
	networking = {
    domain = "";
	  nameservers = [ 
      "1.1.1.1" 
      "8.8.8.8" 
    ];
	};
}
