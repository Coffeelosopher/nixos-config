{ config, pkgs, ... }:

{
    services.croc = {
        enable = true;
        pass = "${secrets.croc_password}";
        openFirewall = true;
        ports = [
            9009
            9010
            9011
            9012
            9013
        ];
    };
}

