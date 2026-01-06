{ config, pkgs, ... } : 

{
  nix.gc = {
    automatic = true;
    dates = "05:30";
    options = "--delete-older-than 7d";
    persistent = true;
    randomizedDelaySec = "30min";
  };

  virtualisation.docker = {
    autoPrune = {
      enable = true;
      dates = "05:30";
      flags = [ "-af" ];
    };
  };
}
