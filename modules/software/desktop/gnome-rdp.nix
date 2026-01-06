{ config, pkgs, ... }:

{
  imports =
  [ 
  ../configs/gnome.nix
  ];

  # Enable Remote desktop
  services.xrdp.enable = true;
  # networking.firewall.allowedTCPPorts = [ 3389 ];
  services.gnome.gnome-remote-desktop.enable = true;

}