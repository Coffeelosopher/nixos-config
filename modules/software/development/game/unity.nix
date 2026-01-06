{ config, pkgs, Machine, ... }:

{

  imports = [ ];

  users.users.${Machine.username} = {
    packages = with pkgs; [
      unityhub
      jetbrains.rider
    ];
  };
}
