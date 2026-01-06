{ config, pkgs, ... }:

{
  services.netdata = {
    enable = true;
    # port = 19999;
  };
}
