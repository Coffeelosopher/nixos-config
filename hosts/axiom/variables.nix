{ config, lib, pkgs, ... }: 

{
  _module.args = {
    Machine = {
      hostname = "axiom";
      username = "nico";
      userDescription = "Nico Nicklis";
    };
  };
}
