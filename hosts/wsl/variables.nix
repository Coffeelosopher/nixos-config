{ config, lib, pkgs, modulesPath, ... }: 

{
  _module.args = {
    Machine = {
      hostname = "wsl";
      username = "nixos";
      userDescription = "privileged user";
    };
  };
}
