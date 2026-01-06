{ config, pkgs, ... }:

{
  services.zerotierone = {
    enable = true;
    joinNetworks = [ "ABCDEFGHIJKLMNOP" ]; # change network id
  };

  # Disable Firewall on this interface
  # XR Choosen Devices can access everything
  networking.firewall = { trustedInterfaces = [ "ztuzergj3f" ]; };
}
