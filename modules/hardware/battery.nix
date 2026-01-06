{ config, pkgs, ... }: 

{
  # Battery Management
  services = {
    thermald.enable = true;
    tlp = {
      enable = false;
      settings = {
        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
        START_CHARGE_THRESH_BAT1 = 75;
        STOP_CHARGE_THRESH_BAT1 = 80;
      };
    };
  };
}
