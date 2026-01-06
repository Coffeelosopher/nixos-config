{ config, pkgs, ... }: 

{
  environment.systemPackages = with pkgs; [
    modrinth-app

  ];
}
