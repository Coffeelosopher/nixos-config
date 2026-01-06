{ config, pkgs, Machine, ... }: 

{
  imports = [ 
    #./wsl-flatpak.nix
  ];

  users.users."${Machine.username}"= {
    packages = with pkgs; [

      kdePackages.dolphin
    ];
  };

}
