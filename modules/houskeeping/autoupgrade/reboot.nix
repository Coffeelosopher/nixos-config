{ config, pkgs, ... }: 

{
  imports = [ ./default.nix ];
  system.autoUpgrade = {
    allowReboot = true;
    rebootWindow = {
      lower = "03:00";
      upper = "06:00";
    };
  };
}
