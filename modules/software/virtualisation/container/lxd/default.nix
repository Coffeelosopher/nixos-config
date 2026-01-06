{ config, pkgs, ... }: 

{
  virtualisation.lxd = {
    enable = true;
    recommendedSysctlSettings = true;
  };
}
