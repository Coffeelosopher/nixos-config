{ config, pkgs, ... }: 

{
  imports = [ 
    ./steam.nix
    ./lutris.nix
    ./minecraft.nix
  ];

#### experiments ####
  programs.gamemode.enable = true;
}
