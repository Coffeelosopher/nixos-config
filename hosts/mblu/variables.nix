{ config, lib, pkgs, modulesPath, ... }: 

{
  _module.args = {
    Machine = {
      hostname = "mblu";
      username = "nico";
      userDescription = "Nico Nicklis";
    };
  };
}
