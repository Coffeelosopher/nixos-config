{ config, lib, pkgs, ... }:

{
  services.mullvad-vpn = {
    enable = true;
    package = pkgs.mullvad-vpn;
  };

  networking.resolvconf.enable = false; # fix for pull request that broke DNS resolution on SystemD resolve
  environment.systemPackages = with pkgs;[
        mullvad-vpn
  ];
}
