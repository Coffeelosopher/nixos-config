{ config, pkgs, ... }: 

{
  environment.systemPackages = with pkgs; [
    zulu17
  ];  
}
