{ config, pkgs, Machine, ... }: 

{
  imports = [ 
    ./default.nix
  ];

  users.users.${Machine.username} = {
    packages = with pkgs; [ ];
  };
}
