{ config, lib, pkgs, modulesPath, ... }: 

{
  _module.args = {
    Machine = {
      hostname = "nuc";
      username = "nico";
      userDescription = "Nico Nicklis";
    };
  };
}
